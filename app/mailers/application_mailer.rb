class ApplicationMailer < ActionMailer::Base
  # default from: ENV["GMAIL_USER_NAME"]
  default from: "no-reply@aerosplat.com"
  layout 'mailer'
end
