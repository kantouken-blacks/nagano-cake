class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
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
