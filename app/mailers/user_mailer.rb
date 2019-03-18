class UserMailer < ApplicationMailer
  def eligible_email(user, election, password)
    @election = election
    @user = user
    @password = password
    mail(to: @user.email, subject: "Vote for #{@election}!")
  end

  def existing_voter(user, election)
    @election = election
    @user = user
    mail(to: @user.email, subject: "Vote for #{@election}!")
  end
end
