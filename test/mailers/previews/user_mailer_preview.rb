# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def eligible_email
    user = User.first
    UserMailer.eligible_email(user)
  end

  def existing_voter
    user = User.first
    UserMailer.existing_voter(user)
  end
end
