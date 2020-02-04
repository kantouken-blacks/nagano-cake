class CartItemsController < ApplicationController
  before_action :authenticate_customer!

 def index
   @cart_items = current_customer.cart_items
   @total_price = calculate(current_customer)
 end

 def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   cart_items = current_customer.cart_items
   @validate_into_cart = @cart_item.validate_into_cart
   if @validate_into_cart == false
      flash[:into_cart_error] = "個数が選択されていないか、すでにカートに追加されているアイテムです。"
      redirect_to item_path(params[:cart_item][:item_id])
   else
     @cart_item.save
     redirect_to cart_items_path
   end
 end

 def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
 end

 def destroy
   cart_item = CartItem.find(params[:id])
   cart_item.destroy
   redirect_to cart_items_path
 end

 def destroy_all
   current_customer.cart_items.destroy_all
   redirect_to cart_items_path
 end

 private
 def cart_item_params
   params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
 end

 def calculate(user)
   total_price = 0
   user.cart_items.each do |cart_item|
     total_price += cart_item.quantity * cart_item.item.price
   end
   return (total_price * 1.1).floor
 end
end