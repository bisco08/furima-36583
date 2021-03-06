class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
    if current_user.id == @item.user_id && @item.purchase.present?
      redirect_to root_path
    end
  end

  def update
    if  @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end   
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :content, :price, :category_id, :condition_id, :area_id, :shipping_charge_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
