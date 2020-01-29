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
    @ship_address_new = ShipAddress.new
    @ship_addresses = current_customer.ship_addresses
    @order = Order.new
  end

  def create
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.save
  end

  def confirm
  end

  private
   def ship_address_params
     params.require(:ship_address).permit(:last_name, :first_name, :post_code, :address)
   end
end
