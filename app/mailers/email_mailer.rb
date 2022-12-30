class EmailMailer < ApplicationMailer
  default bcc: -> { User.pluck(:email) }

  def mail_send(user, email)
    @user = user
    @email = email
    mail(subject: @email[:subject])
  end

end
