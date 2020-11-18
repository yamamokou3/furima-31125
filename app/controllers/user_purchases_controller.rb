class UserPurchasesController < ApplicationController
before_action :set_item
  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(delivery_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def set_item
   @item = Item.find(params[:item_id])
  end

  def delivery_params
    params.require(:user_purchase).permit( :zip_cpde, :area_id, :municipality, :address, :building_name, :phone_number, :purchase_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_17b50eb190711cd2d0236e92"
      Payjp::Charge.create(
        amount: @item.price,
        card: delivery_params[:token],
        currency: 'jpy'
      )
  end

end
