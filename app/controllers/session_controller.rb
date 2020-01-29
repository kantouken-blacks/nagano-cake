class SessionController < ApplicationController
  # ordersコントローラーにコピー済み
  def new
    @ship_address = ShipAddress.new
    @order = Order.new
  end

  def create
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.save
  end

  private
   def ship_address_params
     params.require(:ship_address).permit(:last_name, :first_name, :post_code, :address)
   end
end
