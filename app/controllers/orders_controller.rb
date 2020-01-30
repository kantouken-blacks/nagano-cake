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
    @order = Order.new
  end

  #ここでconfirm画面でボタンを押して情報を保存
  def create
    # @ship_address = ShipAddress.new(ship_address_params)
    # @order = Order.new(order_params)
    # @order.customer_id = current_customer.id
    # @order.save!
    # redirect_to new_order_path

  end

  def confirm
      @orders = current_customer.orders
      @order = session[:order]
      @total_price = calculate(current_customer)

  end

  def create_ship_address
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.customer_id = current_customer.id
    @ship_address.save
    redirect_to new_order_path
  end

  # 入力情報をsessionに格納
  def create_order
    # session[:order] = Order.new(order_params)
    session[:order][:payment] = params[:order][:payment]
    if params[:order][:carriage] == "select_address"
      session[:order][:address] = params[:order][:address]
    elsif params[:order][:carriage] == "my_address"
      session[:order][:address] = current_customer.post_code+current_customer.address+current_customer.last_name+current_customer.first_name
    end
    redirect_to orders_confirm_path
  end

  private
   def ship_address_params
     params.require(:ship_address).permit(:customer_id,:last_name, :first_name, :post_code, :address)
   end
   def order_params
     params.require(:order).permit(:customer_id, :address, :switch, :payment, :carriage, :total_price, :order_status)
   end

   def calculate(user)
     total_price = 0
     user.cart_items.each do |cart_item|
       total_price += cart_item.quantity * cart_item.item.price
     end
     return (total_price * 1.1).floor
   end

end
