class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :new_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @OrderDeliveryAddress = OrderDeliveryAddress.new
  end

  def create
    @OrderDeliveryAddress = OrderDeliveryAddress.new(order_save)
    if @OrderDeliveryAddress.valid?
      pay_item
      @OrderDeliveryAddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def new_item
    @item = Item.find(params[:item_id])
  end

  def order_save
    params.require(:order_delivery_address).permit(:delivery_postalcode, :prefecture_id, :delivery_city, :delivery_block, :delivery_building, :orderer_phone_num).merge(
      user_id: current_user.id, item_id: @item.id, price: @item.price, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @item.order.present? || (current_user.id == @item.user_id)
      redirect_to root_path
    end
  end

end
