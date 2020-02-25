class AccountMailer < ActionMailer::Base
  default from: "Honululu <registration@xfccorp.com>"

  def registration_email(email, token)
    @email = email
    @token = token
    mail(to: @email, subject: "Thank you for registration")
  end
end
