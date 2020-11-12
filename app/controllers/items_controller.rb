class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else  
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else  
      render :edit
  end
end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :categroy_id, :status_id, :burden_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
