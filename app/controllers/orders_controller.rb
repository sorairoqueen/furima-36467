class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @OrderDeliveryAddress = OrderDeliveryAddress.new
  end

  def create
    @OrderDeliveryAddress = OrderDeliveryAddress.new(order_save)
    if @OrderDeliveryAddress.valid?
      pay_item
      @OrderDeliveryAddress.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_save
    item = Item.find(params[:item_id])
    params.require(:order_delivery_address).permit(:delivery_postalcode, :prefecture_id, :delivery_city, :delivery_block, :delivery_building, :orderer_phone_num).merge(
      user_id: current_user.id, item_id: item.id, price: item.price, token: params[:token]
    )
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
