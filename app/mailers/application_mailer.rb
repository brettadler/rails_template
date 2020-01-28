class ApplicationMailer < ActionMailer::Base
  default from: ENV['DEFAULT_FROM_EMAIL'], cc: ENV['DEFAULT_BCC_EMAIL']
  layout 'email' # default is 'mailer'
end
