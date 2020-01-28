module Omniauthable

  extend ActiveSupport::Concern

  # UserIdentities

  # has_many :identities
  # attr_accessor :oauth_processing

  # # Started with code from:
  # # http://sourcey.com/rails-4-omniauth-using-devise-with-twitter-facebook-and-linkedin/
  # def self.find_for_oauth(auth, signed_in_resource = nil)

  #   # Get the identity and user if they exist
  #   identity = Identity.find_for_oauth(auth)

  #   # If a signed_in_resource is provided it always overrides the existing user
  #   # to prevent the identity being locked with accidentally created accounts.
  #   # Note that this may leave zombie accounts (with no associated identity) which
  #   # can be cleaned up at a later date.
  #   user = signed_in_resource ? signed_in_resource : identity.user

  #   # Create the user if needed
  #   if user.blank?

  #     # Get the existing user by email if the provider gives us a verified email.
  #     # If no verified email was provided we assign a temporary email and ask the
  #     # user to verify it on the next step via UsersController.finish_signup
  #     if auth.info.email &&
  #       (!auth.info.key?('verified') || auth.info.verified) &&
  #       (!auth.info.key?('verified_email') || auth.info.verified_email)
  #       email = auth.info.email
  #     end
  #     user = User.where(email: email).first if email

  #     # Create the user if it's a new registration
  #     if user.blank?
  #       user = User.new(
  #         # username: auth.info.nickname || auth.uid,
  #         email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com"
  #       )
  #       user.oauth_processing = true
  #       user.save!
  #     end
  #   end

  #   # Associate the identity with the user if needed
  #   if identity.user != user
  #     identity.user = user
  #     identity.save!
  #   end
  #   user
  # end

  # # Override Devise lock_access! to allow slack notification when an account is locked
  # def lock_access!(opts = {})
  #   slack_critical_alert("User #{self.email} (#{self.id})'s account has been locked! Might be nothing....but we may want to look in to it.")
  #   super(opts)
  # end

  # # Override Devise active_for_authentication?
  # def active_for_authentication?
  #   super && self.active?
  # end


  # def password_required?
  #   !persisted? && @oauth_processing.nil? && self.identities.count.zero?
  # end

  # def password_set
  #   self.encrypted_password.present?
  # end


  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.first_name = auth.info.first_name
  #     user.last_name = auth.info.last_name
  #     # user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end


end
