class MembersController < ApplicationController
  before_action :find_user, only: [:index, :new, :create, :edit, :update]

  def index
    @member = @user.member
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path
    else
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to members_path
  end

  private
  def find_user
    @user = User.find(current_user.id)
  end

  def member_params
    params.require(:member).permit(:postal_code, :prefecture_id, :address, :building_name, :phone_number, :part_id).merge(user_id: current_user.id)
  end
end
