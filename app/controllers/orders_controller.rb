class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @OrderDeliveryaddress = OrderDeliveryaddress.new()
  end
  def create
  end
end
