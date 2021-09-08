class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if current_user.id == @item.user_id && @item.purchase.present?
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_address)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render :index 
    end
  end

  private

  def purchase_address
    params.require(:purchase_address).permit(:postal_code, :area_id, :municipality, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_address[:token],
        currency: 'jpy'
      )
  end
end
