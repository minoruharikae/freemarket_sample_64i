class UsersController < ApplicationController

  def show
  end

  def profile
    @user = User.find_by(id: current_user.id)
  end

  def address
    @user = User.find_by(id: current_user.id)
    @address = Address.find_by(user_id: current_user.id)
  end
  
  def address_update
    user = User.find(params[:id])
    user.update(user_params)
    address = Address.where(user_id: user.id)[0]
    address.update(user_address_params)
    redirect_to user_path(params[:id])
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
    @user = User.find_by(id: current_user.id)
  end

  def dealing
    @user = User.find_by(id: current_user.id)
  end

  def sold
    @user = User.find_by(id: current_user.id)
  end

  def buying
    @user = User.find_by(id: current_user.id)
    @buys = Buy.where(user_id: current_user.id)

    @buied_goods = []
    @buys.each do |buy|
      buy = Good.where(id: buy.id).first
      @buied_goods << buy
    end

  end

  def bought
    @user = User.find_by(id: current_user.id)
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
      :phone_number
    )
  end
end
