class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = @order_details.sum(:item_price)
  end

  def new
    @ship_addresses = current_customer.ship_addresses
    @ships = []
    @ship_addresses.each do |ship|
      @ships.push("〒" + ship.post_code + "  " + ship.address + "  " + ship.last_name + ship.first_name)
    end
    @ship_address = ShipAddress.new
    # binding.pry
    @order = Order.new
  end

  #ここでconfirm画面でボタンを押して情報を保存
  def create
    # @ship_address = ShipAddress.new(ship_address_params)
    # @order = Order.new(order_params)
    # @order.customer_id = current_customer.id
    # # binding.pry
    # @order.save!
    # redirect_to new_order_path

  end

  def confirm
      @orders = current_customer.orders
      @order = session[:order]
      @total_price = test(current_customer)

  end

  # 入力情報をsessionに格納
  def create_order
    session[:order] = Order.new(order_params)
    # session[:order]["customer_id"] = current_customer.id
    # session[:order][:total_price] = 800
    # session[:order] = order_params
    # binding.pry
    redirect_to orders_confirm_path
  end

  private
   def ship_address_params
     params.permit(:last_name, :first_name, :post_code, :address)
   end
   def order_params
     params.require(:order).permit(:customer_id, :address, :payment, :carriage, :total_price, :order_status)
   end

   def calculate(user)
    total_price = []

      user.cart_items.each do |cart|
        total_price = [cart.item.price * cart.quantity]
        return (total_price.sum * 1.1).floor
      end
    return total_price
   end

   def test(user)
     while user.cart_items.count do
       total_price = []
       user.cart_items.each do |cart|
         return subtotal = cart.item.price * cart.quantity
       end
       
       total_price += subtotal

     end
     return (total_price.sum * 1.1).floor
   end

end
