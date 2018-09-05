class AccountMailer < ActionMailer::Base
  default from: "#{ENV['COMPANY_NAME']} <#{ENV['COMPANY_EMAIL']}>"

  def registration_email(email, token)
    @email = email
    @token = token
    mail(to: @email, subject: "Thank you for registration")
  end
end
