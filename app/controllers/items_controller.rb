class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :item_params, only: [:show, :edit]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @item = Item.order(created_at: :DESC)
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
    @item = Item.find(params[:id])
    if  @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end   
  end
    

  private
  def item_params
    params.require(:item).permit(:item_name, :content, :price, :category_id, :condition_id, :area_id, :shipping_charge_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def item_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
