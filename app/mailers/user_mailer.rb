class UserMailer < ApplicationMailer
  def eligible_email(user)
    # @url = 'http://example.com/login'
    mail(to: user.email, subject: "Vote for election!")
  end
end
