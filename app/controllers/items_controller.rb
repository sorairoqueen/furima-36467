class ItemsController < ApplicationController
  def index
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

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :item_category_id, :item_status_id, :fee_resp_id, :prefecture_id, :delivery_term_id, :content)
  end

end
