require "#{Rails.root}/app/controllers/concerns/slackable.rb"
include Slackable

namespace :slack do

  desc "Send message to usage-log Slack channel"
  task :slack_usage_alert, [:message] => :environment do |_task, args|
    slack_usage_alert(args.message)
  end

  desc "Send message to critical-alerts Slack channel"
  task :send_critical_alert, [:message] => :environment do |_task, args|
    slack_critical_alert(args.message)
  end

  desc "Send message to error-log Slack channel"
  task :send_error_alert, [:message] => :environment do |_task, args|
    slack_error_alert(args.message)
  end

  desc "Send message to sales-alerts Slack channel"
  task :send_sales_alert, [:message] => :environment do |_task, args|
    slack_sales_alert(args.message)
  end

  desc "Send test messages to all Slack channels"
  task :test, [:message] => :environment do |_task|
    Rake::Task['slack:slack_usage_alert'].invoke("This is a test of sending a usage notification message to slack via a rake")
    Rake::Task['slack:send_critical_alert'].invoke("This is a test of sending a critical message to slack via a rake")
    Rake::Task['slack:send_error_alert'].invoke("This is a test of sending an error message to slack via a rake")
    Rake::Task['slack:send_sales_alert'].invoke("This is a test of sending a sales message to slack via a rake")
  end

end
