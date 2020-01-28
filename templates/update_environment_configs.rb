def update_environment_configs

# ==============================================
# Application configuration
# ==============================================

inject_into_file 'config/application.rb', after: "class Application < Rails::Application" do
  <<-RUBY


    # https://thoughtbot.com/blog/content-compression-with-rack-deflater
    # config.middleware.insert_after ActionDispatch::Static, Rack::Deflater

    config.active_job.queue_adapter = :delayed_job
  RUBY
end

# ==============================================
# Production environment configuration
# ==============================================

inject_into_file 'config/environments/production.rb', after: "config/application.rb.\n" do
  <<-RUBY


  # https://github.com/roidrage/lograge
  #config.lograge.enabled = true

  # Google Analytics
  #GA.tracker = ENV['GOOGLE_ANALYTICS_ID'] if ENV['GOOGLE_ANALYTICS_ID'].present?

  # Default action mailer
  # config.action_mailer.default_url_options = { host: ENV['DOMAIN_NAME'], protocol: "https" }
  config.action_mailer.smtp_settings = {
    authentication: :plain,
    enable_starttls_auto: true,
    port: ENV['SMTP_PORT'],
    address: ENV['SMTP_ADDRESS'],
    domain: ENV['SMTP_DOMAIN'],
    password: ENV['SMTP_PASSWORD'],
    user_name: ENV['SMTP_USERNAME']
  }
  RUBY
end

# ==============================================
# Development environment configuration
# ==============================================

inject_into_file 'config/environments/development.rb', after: "config/application.rb.\n" do
  <<-RUBY

  # configure bullet
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.add_footer = true
    Bullet.console = true
    # Bullet.alert = true
    # Bullet.rails_logger = true
  end

  # Default action mailer
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :letter_opener
  RUBY
end

# ==============================================
# Test environment configuration
# ==============================================

inject_into_file 'config/environments/test.rb', after: "config/application.rb.\n" do
  <<-RUBY

  # Default action mailer
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  RUBY
end

end
