class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :new_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :item_category_id, :item_status_id, :fee_resp_id, :prefecture_id,
                                 :delivery_term_id, :content, :image).merge(user_id: current_user.id)
  end

  def new_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
