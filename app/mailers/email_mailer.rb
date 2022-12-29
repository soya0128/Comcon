class EmailMailer < ApplicationMailer

  def mail_send(email, user)
    @user = User.find(current_user.id)
    @email = email
    mail(to: User.pluck[:email], subject: @email.title)
  end

end
