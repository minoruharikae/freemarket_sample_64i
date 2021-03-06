class UsersController < ApplicationController
  before_action :move_to_toppage

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find_by(id: current_user.id)
  end

  def profile_update
    user = User.where(id: current_user.id)
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def address_edit
    @address = Address.find_by(user_id: current_user.id)
  end
  
  def address_update
    address = Address.where(user_id: current_user.id)[0]
    address.update(user_address_params)
    redirect_to user_path(current_user.id)
  end

  def payment
  end

  def email
    @user = User.find_by(id: current_user.id)
  end

  def identification
    @user = User.find(current_user.id)
  end

  def logout
  end

  def news
  end

  def guide
  end

  def contact
  end
 
  def todo
    @user = User.find_by(id: current_user.id)
  end

  def likes
    @user = User.find_by(id: current_user.id)
  end

  def items
    @goods = Good.where(user_id: current_user.id)
  end

  def dealing
    @goods = Good.where(user_id: current_user.id)
  end

  def sold
    @goods = Good.where(user_id: current_user.id)
  end

  def buying
    @buys = Buy.where(user_id: current_user.id)
    @good = []
    @buys.each do |buy|
      buy = Good.where(id: buy.good_id).first
      @good << buy
    end
  end

  def bought
    @buys = Buy.where(user_id: current_user.id)
    @good = []
    @buys.each do |buy|
      buy = Good.where(id: buy.good_id).first
      @good << buy
    end
  end

  def rates
    @user = User.find_by(id: current_user.id)
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end
  
  private
  def user_address_params
    params.require(:address).permit(
      :family_name,
      :first_name,
      :family_kana,
      :first_kana,
      :phone_number,
      :post,
      :prefecture,
      :city,
      :address,
      :buil
    )
  end

  def user_params
    params.require(:user).permit(
      :nick_name,
      :email,
      :password,
      :family_name,
      :first_name,
      :family_kana,
      :first_kana,
      :birthday_year,
      :birthday_month,
      :birthday_date,
      :phone_number,
      :profile
    )
  end

  def move_to_toppage
    redirect_to root_path unless user_signed_in?
  end

end
