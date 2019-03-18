class UserMailer < ApplicationMailer
  def eligible_email(user, election, password)
    # @url = 'http://example.com/login'
    @election = election
    @user = user
    @password = password
    mail(to: @user.email, subject: "Vote for #{@election}!")
  end
end
