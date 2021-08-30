class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    unless @item.save  
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :content, :price, :category_id, :condition_id, :area_id, :shipping_charge_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end
end
