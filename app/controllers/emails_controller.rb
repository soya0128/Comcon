class EmailsController < ApplicationController
  def index
    @emails = Email.includes(:user)
  end

  def new
    @user = User.find(current_user.id)
    @email = Email.new
  end

  def create
    @user = User.find(current_user.id)
    @email = Email.new(email_params)
    if @email.save
      EmailMailer.mail_send(@user, @email).deliver
      redirect_to action:'index', notice: 'メールを送信しました'
    else
      render :new
    end
  end

  def show
    @email = Email.find(params[:id])
  end

  private
  def email_params
    params.require(:email).permit(:subject, :content).merge(user_id: current_user.id)
  end
end
