class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.build(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end
end
