class PaymentsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @payments = Payment.includes(:user).order("created_at DESC").where(:user_id == current_user.id)
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.valid?
      pay_by_card
      @payment.save
      return redirect_to payments_path
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:price).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_by_card
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: payment_params[:price],
      card: payment_params[:token],
      currency: 'jpy'
    )
  end
end
