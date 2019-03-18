class UserMailer < ApplicationMailer
  def eligible_email(election)
    @election = election
    @user = params[:user]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: "Vote for #{election.name}!")
  end
end
