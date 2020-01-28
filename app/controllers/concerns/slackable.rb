module Slackable

  extend ActiveSupport::Concern

  private

  # slack_alert_wrapper - current user, environment, etc.
  # slack_create_alert
  # slack_update_alert
  # slack_save_error_alert
  # slack_usage_alert
  # slack_notification
  # slack_error_alert
  # slack_critical_alert
  # slack_sales_alert
  # slack_new_user_alert
  # slack_dev_alert

  # slack_usage_alert("Testing alerts for notifications channel on #{ENV['SYSTEM_NAME']}")
  def slack_usage_alert(message = nil)
    slack_notifier(message, :usage) if message.present?
  end
  # handle_asynchronously :slack_usage_alert

  # slack_critical_alert("Testing alerts for critical-alerts channel on #{ENV['SYSTEM_NAME']}")
  def slack_critical_alert(message = nil)
    slack_notifier(message, :critical) if message.present?
  end

  # slack_sales_alert("Testing alerts for sales-alerts channel on #{ENV['SYSTEM_NAME']}")
  def slack_sales_alert(message = nil)
    slack_notifier(message, :sales) if message.present?
  end

  # slack_error_alert("Testing alerts for error-alerts channel on #{ENV['SYSTEM_NAME']}")
  def slack_error_alert(message = nil)
    slack_notifier(message, :error) if message.present?
  end
  # handle_asynchronously :slack_error_alert

  def slack_notifier(message = nil, channel = nil)

    # Disable when web hooks are not set
    webhook_url = case channel
                  when :usage
                    ENV["SLACK_WEBOOK_USAGE"]
                  when :critical
                    ENV["SLACK_WEBOOK_CRITICAL"]
                  when :sales
                    ENV["SLACK_WEBOOK_SALES"]
                  when :error
                    ENV["SLACK_WEBOOK_ERRORS"]
                  else
                    ENV["SLACK_WEBOOK_USAGE"]
                  end

    return false if message.blank? || webhook_url.blank?

    require 'slack-notifier'
    notifier = Slack::Notifier.new webhook_url
    notifier.ping message.to_s

  end

end
