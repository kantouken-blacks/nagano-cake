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

  def create
    @ship_address = ShipAddress.new(ship_address_params)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # binding.pry
    @order.save!
    redirect_to new_order_path

  end

  def confirm
    @orders = current_customer.orders
  end

  def create_order
  end 

  private
   def ship_address_params
     params.permit(:last_name, :first_name, :post_code, :address)
   end
   def order_params
     params.require(:order).permit(:customer_id, :address, :payment, :carriage, :total_price, :order_status)
   end
end
