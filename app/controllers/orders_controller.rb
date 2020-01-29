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
    @ship_address_new = ShipAddress.new
    # binding.pry
    @order = Order.new
  end

  def create
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.save
    redirect_to orders_confirm_path
  end

  def confirm
    @orders = current_customer.orders
  end


  private
   def ship_address_params
     params.permit(:last_name, :first_name, :post_code, :address)
   end
end
