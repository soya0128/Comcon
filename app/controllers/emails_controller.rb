class EmailsController < ApplicationController
  def index
    @emails = Email.include(:user)
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      redirect_to action:'index'
    else
      render :new
    end
  end

  private

  def email_params
    params.require(:email).permit(:title, :content).merge(user_id: current_user.id)
  end
end