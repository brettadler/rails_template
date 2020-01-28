class ApplicationController < ActionController::Base

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :check_user_is_enabled
  before_action :set_table_settings
  after_action :track_last_activity_for_current_user

  # Note these will trigger a crash if we forget to authorize
  # BUT they will not prevent the action from happening
  # Their purpose is to make it obvious when we have forgotten... but not to secure the data
  # For controllers where they are not needed use: skip_after_action <action_name>
  # They are bipassed for the devise controllers
  # after_action :verify_authorized, except: :index, unless: :skip_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_controller?

  def check_user_is_enabled
    sign_out(current_user) if current_user && !current_user.enabled?
  end

  def user_not_authorized
    msg = current_user ? "You are not authorized to access that page" : "Please log in to continue"
    redirect_to root_path, alert: msg
  end

  def authenticate_admin
    authenticate_user!
    redirect_to root_path unless current_user && current_user.admin?
  end

  def track_last_activity_for_current_user
    return unless current_user
    current_user.track_last_activity(controller_name, action_name)
  end

  def debug(message, title = nil)
    return unless message.present?
    puts ""
    puts "=" * 100
    puts title.upcase if title.present?
    puts "-" * 50 if title.present?
    puts message.inspect
    puts "=" * 100
    puts ""
  end

  def debug_errors(object)
    return unless object.errors && object.errors.full_messages
    debug(object.errors.full_messages)
  end

  def set_table_settings

    @table_settings = {
      "data-toggle": "table",
      "data-search": "true",
      "data-search-align": "left",
      "data-pagination": "false",
      "data-page-list": "[All,20,50,100]",
      "data-page-size": "All",

      # Cookies
      # https://github.com/wenzhixin/bootstrap-table/tree/master/src/extensions/cookie
      # Note: table id must either be set on each table... or this value changed to match a different style id for a table
      # This can be set when being used like this: @table_settings.merge({"data-cookie-id-table":"projects-list"})
      "data-cookie": "true",
      "data-cookie-expire": "1y", #  optional lengths include 's','mi','h','d','m','y'
      "data-cookie-id-table": "#{controller_name}_#{action_name}_table",
      "data-cookies-enabled": ['bs.table.sortOrder', 'bs.table.sortName', 'bs.table.pageList', 'bs.table.columns']

    }

    @table_settings_simple = {
      "data-toggle": "table",
      "data-search": "false",
      "data-pagination": "false"
    }

  end

end
