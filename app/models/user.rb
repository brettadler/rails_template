class User < ApplicationRecord

  # ===================================================
  # Includes
  # ===================================================

  # include Omniauthable
  # include Slackable
  # include Stripeable

  # ===================================================
  # Callbacks
  # ===================================================

  # after_create :setup_user
  # after_initialize :set_tracker
  # after_create :send_create_notice_to_slack
  # after_create :track_signup

  # ===================================================
  # Scopes
  # ===================================================

  scope :enableds, -> { where(enableds: true) }

  scope :admins, -> { enableds.where(admin: true) }
  scope :reals, -> { enableds.where(test: [false, nil]) }
  scope :tests, -> { enableds.where(test: true) }

  scope :by_name, -> { enableds.order('LOWER(TRIM(users.first_name))').order('LOWER(TRIM(users.last_name))') }

  scope :search, -> (search) { enableds.where('LOWER(users.first_name) LIKE :search OR LOWER(users.last_name) LIKE :search OR LOWER(users.email) LIKE :search', search: "%#{search.downcase.strip}%").by_name }

  # ===================================================
  # Validations
  # ===================================================

  validates :email, presence: true
  # validates :first_name, :last_name, presence: true, on: :update, if: :editing_profile?

  # ===================================================
  # Relationships
  # ===================================================

  has_one :physical_address, -> { where address_type: Address.address_types[:physical] }, as: :addressable, class_name: "Address"
  has_one :mailing_address, -> { where address_type: Address.address_types[:mailing] }, as: :addressable, class_name: "Address"
  has_one :billing_address, -> { where address_type: Address.address_types[:billing] }, as: :addressable, class_name: "Address"
  has_one :shipping_address, -> { where address_type: Address.address_types[:shipping] }, as: :addressable, class_name: "Address"

  # ===================================================
  # Methods
  # ===================================================

  def name
    "#{self.first_name&.strip} #{self.last_name&.strip}".strip
  end

  def profile_setup?
    self.email.present? && self.first_name.present? && self.last_name.present?
  end

  def track_last_activity(controller_name = nil, action_name = nil)
    self.last_active_at = Time.now
    self.last_activity = (controller_name.present? && action_name.present? ? "#{controller_name} - #{action_name}" : "unknown")
    self.save(validate: false)
  end

  def self.export_attributes
    [
      ["User ID", "id"],
      ["Email", "email"],
      ["Sign Ins", "sign_in_count"],
      ["Created At", "created_at"],
      ["Last Active At", "last_active_at"]
    ]
  end

  # ===================================================
  # Devise
  # ===================================================

  # OMNIAUTH_PROVIDERS = [:linkedin, :facebook, :google_oauth2].freeze
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :lockable
         # :async, (requires activejob setup)
         # :omniauthable, omniauth_providers: OMNIAUTH_PROVIDERS

 devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  # ===================================================
  # ProfilePic
  # ===================================================

  # mount_uploader :profile_pic, ProfilePicUploader

  # def enqueue_avatar
  #   if self.key.present?
  #     self.remote_avatar_url = avatar.direct_fog_url(with_path: true)
  #     save
  #   end
  # end
  # handle_asynchronously :enqueue_avatar

  # ===================================================
  # Mailers
  # ===================================================

  # after_create :send_confirmation_email
  # after_update :update_mailing_lists, if: :saved_change_to_email?

  # def send_welcome_email
  #   UserMailer.welcome(self).deliver
  # end
  # handle_asynchronously :send_welcome_email

  # def send_create_notice_to_slack
  #   slack_new_user_alert("User #{self.email} created an account on #{ENV['SYSTEM_NAME']}")
  # end

  # def send_confirmation_email
  #   UserMailer.confirmation(self).deliver
  # end
  # handle_asynchronously :send_confirmation_email

  # ===================================================
  # Alerts
  # ===================================================

  # User registered
  # Profile Updated
  # User disabled

  # ===================================================
  # Passwords
  # ===================================================

  # # Used to generate password rules for users in the view
  # # Must still update signin.coffee logic to match any changes in the below rules or validations
  # PASSWORD_RULES = {
  #   'password_min' => ' be at least 8 characters long',
  #   'password_lower_upper' => ' include both upper and lowercase characters',
  #   'password_digit_special' => ' include at least one digit or special character'
  # }.freeze

  # validates :password, format: { with: /(?=.*[A-Z])/, message: "must contain at least one uppercase character." }, allow_blank: true
  # validates :password, format: { with: /(?=.*[a-z])/, message: "must contain at least one lowercase character." }, allow_blank: true
  # validates :password, format: { with: /(?=.*[\d!\?@#\$%&\*"'\(\)\+,-\.\/:;<=>\[\\\]\^_`{|}~])/, message: "must contain at least one one digit or special character." }, allow_blank: true

  # ===================================================
  # User Invite
  # ===================================================

  # after_create :accept_invite
  # has_many :user_invites, -> { where(disabled: [false, nil]) }
  # has_many :invites_sent, -> { where(active: true) }, foreign_key: "created_by_user_id", class_name: InviteUser, as: :inviteable


  # def accept_invite

  #   if self.invite_uuid.present?
  #     invite = InviteUser.unaccepteds.find_by_uuid(self.invite_uuid)
  #     invite.accept(self) if invite
  #   end

  # end

  # def accept_if_invited
  #   return unless self.invite_uuid.present?
  #   invite = UserInvite.unaccepteds.find_by_invite_uuid(self.invite_uuid)
  #   invite&.accept
  #   UserOrganization.create(user: self, organization: invite.organization, status: UserOrganization.statuses[:active], role: invite.role.present? ? invite.role : UserOrganization.roles[:staff]) if invite.organization
  # end




#   include Slackable
#   include Stripeable

#   require 'mixpanel-ruby'
#   acts_as_token_authenticatable

#   # Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

#   validates :email, :first_name, :last_name, presence: true

#   scope(:enableds, -> { where(disabled: [false, nil]) })
#   scope(:admins, -> { enableds.where(admin: true) })
#   scope :by_name, -> { order('LOWER(users.first_name), LOWER(users.last_name)') }

#   has_many :user_organizations, -> { where(disabled: [false, nil]) }
#   has_many :organizations, -> { where(disabled: [false, nil]) }, through: :user_organizations
#   has_many :events, -> { where(disabled: [false, nil]) }, through: :organizations
#   has_many :user_invites, -> { where(disabled: [false, nil]) }

#   has_many :user_teams, -> { where(disabled: [false, nil]) }
#   has_many :teams, -> { where(disabled: [false, nil]) }, through: :user_teams

#   after_create :setup_user
#   after_initialize :set_tracker
#   # after_update :update_mailing_lists, if: :saved_change_to_email?

#   enum stage: {
#     stage_register: 1,
#     stage_create_organization: 2,
#     stage_create_event: 3,
#     stage_invite_admins: 4,
#     stage_event_setup: 5,
#     stage_event_open: 6
#   }

#   enum account_type: {
#     organization: 1,
#     team_captain: 2,
#     volunteer: 3,
#     resident: 4
#   }

#   def self.from_omniauth(auth)
#     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#       user.email = auth.info.email
#       user.password = Devise.friendly_token[0, 20]
#       user.first_name = auth.info.first_name
#       user.last_name = auth.info.last_name
#       # user.image = auth.info.image # assuming the user model has an image
#       # If you are using confirmable and the provider(s) you use validate emails,
#       # uncomment the line below to skip the confirmation emails.
#       # user.skip_confirmation!
#     end
#   end

#   def name
#     "#{self.first_name} #{self.last_name}"
#   end

#   def contact_phone
#     self.phone_number
#   end

#   def default_organization
#     self.organizations.first if self.organizations.size.positive?
#   end

#   def default_role
#     return unless self.default_organization
#     UserOrganization.enableds.where(user: self, organization: self.default_organization).first&.role
#   end

#   def default_event
#     self.default_organization.default_event if self.default_organization && self.default_organization.default_event
#   end

#   def default_team
#     self.teams.last if self.account_type == "team_captain" && self.teams.size.positive?
#   end

#   def org_admin?(organization)
#     return unless organization
#     self.user_organizations.where(organization_id: organization.id, role: UserOrganization.roles["admin"]).size.positive?
#   end

#   def org_staff?(organization)
#     return unless organization
#     self.user_organizations.where(organization_id: organization.id, role: UserOrganization.roles["staff"]).size.positive?
#   end

#   def org_interviewer?(organization)
#     return unless organization
#     self.user_organizations.where(organization_id: organization.id, role: UserOrganization.roles["interviewer"]).size.positive?
#   end

#   def org_supplier?(organization)
#     return unless organization
#     self.user_organizations.where(organization_id: organization.id, role: UserOrganization.roles["supplier"]).size.positive?
#   end

#   def account_setup?
#     # self.default_organization.present? && self.default_organization.user_invites.size.positive?
#     self.default_organization.present?
#   end

#   def move_to_event_setup_stage
#     self.update(stage: User.stages[:stage_event_setup])
#   end

#   def stripe_customer?
#     self.stripe_id.present?
#   end

#   def track_event(event, **properties)
#     return unless @tracker
#     if properties.present?
#       @tracker.track(self.id, event, properties)
#     else
#       @tracker.track(self.id, event)
#     end
#     @tracker.people.set(self.id, '$last_activity_at': Time.current, '$email': self.email.presence)
#   end
#   handle_asynchronously :track_event

#   def track_update_profile
#     @tracker.people.set(self.id, '$email': self.email.presence) if @tracker.present?
#   end
#   handle_asynchronously :track_update_profile

#   private

#   def setup_user
#     slack_usage_alert("Yeah! User #{self.name} (#{self.email}) just created an account on #{ENV['SYSTEM_NAME']}")

#     # Hack to set account_type for organizations
#     self.update_attribute(:account_type, User.account_types[:organization]) if self.account_type.blank?

#     return unless self.account_type == "organization"
#     UserMailer.welcome(self).deliver_later
#     track_signup_event
#     set_stripe
#     set_mailchimp
#     accept_if_invited
#     # set initial plan choice, if any
#   end

#   def accept_if_invited
#     return unless self.invite_uuid.present?
#     invite = UserInvite.unaccepteds.find_by_invite_uuid(self.invite_uuid)
#     invite&.accept
#     UserOrganization.create(user: self, organization: invite.organization, status: UserOrganization.statuses[:active], role: invite.role.present? ? invite.role : UserOrganization.roles[:staff]) if invite.organization
#   end

#   def set_tracker
#     @tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_TOKEN']) if ENV['MIXPANEL_TOKEN'].present?
#   end

#   def track_signup_event
#     return unless @tracker
#     @tracker.track(self.id, "Registered")
#     @tracker.people.set(self.id, '$email': self.email.presence, '$signed_up_at': Time.current, '$last_activity_at': Time.current)
#   end
#   handle_asynchronously :track_signup_event

#   def set_stripe

#     include_stripe_backend

#     customer = Stripe::Customer.create(
#       description: "#{self.id} - #{self.name} (#{self.email})",
#       email: self.email
#     )
#     return unless customer

#     self.update(stripe_id: customer[:id])

#     # need to address error handling

#   end
#   handle_asynchronously :set_stripe

#   def set_mailchimp

#     return unless ENV.key?('MAILCHIMP_API_KEY') && ENV.key?('MAILCHIMP_NEWSLETTER_LIST_ID')

#     mailchimp = Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
#     return unless mailchimp

#     response = mailchimp.lists.subscribe(ENV['MAILCHIMP_NEWSLETTER_LIST_ID'], { "email" => self.email }, nil, 'html', false)
#     return unless response && response.key?("leid")

#     self.update(mailchimp_id: response["leid"])

#   rescue Mailchimp::ListDoesNotExistError => error
#     logger.error "Mailchimp list is missing or doesn't exist. Could not add: #{self.email} because of #{error.message}"
#   rescue Mailchimp::Error => error
#     logger.error "Mailchimp error: Could not add: #{self.email} because of #{error.message}"

#   end
#   handle_asynchronously :set_mailchimp

#   def update_mailing_lists
#     old_email, new_email = saved_change_to_email
#     MailChimpMemberUpdater.new.update_email(old_email, new_email)
#   end
#   handle_asynchronously :update_mailing_lists
# end




  private

  # def setup_user
  #   slack_usage_alert("Yeah! User #{self.name} (#{self.email}) just created an account on #{ENV['SYSTEM_NAME']}")

  #   # Hack to set account_type for organizations
  #   self.update_attribute(:account_type, User.account_types[:organization]) if self.account_type.blank?

  #   return unless self.account_type == "organization"
  #   UserMailer.welcome(self).deliver_later
  #   track_signup_event
  #   set_stripe
  #   set_mailchimp
  #   accept_if_invited
  #   # set initial plan choice, if any
  # end


end
