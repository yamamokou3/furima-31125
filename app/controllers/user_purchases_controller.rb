class UserPurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:create]
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: delivery_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    redirect_to root_path if current_user.id || @item.purchase != nil
  end

end
