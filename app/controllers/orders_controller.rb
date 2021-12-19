class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @OrderDeliveryAddress = OrderDeliveryAddress.new()
  end
  def create
    @OrderDeliveryAddress = OrderDeliveryAddress.new(order_save)
    if @OrderDeliveryAddress.valid?
      @OrderDeliveryAddress.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_save
    params.require(:order_delivery_address).permit(:item_id, :delivery_postalcode, :prefecture_id, :delivery_city, :delivery_block, :delivery_building, :orderer_phone_num).merge(user_id: current_user.id)
  end
end
