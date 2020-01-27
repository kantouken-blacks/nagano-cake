class CartItemsController < ApplicationController
  def index
    # @item = Item.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to cart_items_path
  end
end
