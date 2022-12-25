class MembersController < ApplicationController
  def index
    @user = User.find(current_user.id)
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
    if @member.update(member_params)
      redirect_to members_path
    else
      render :edit
    end
  end

  private
  def member_params
    params.require(:member).permit(:postal_code, :prefecture_id, :address, :building_name, :phone_number, :part_id).merge(user_id: current_user.id)
  end
end
