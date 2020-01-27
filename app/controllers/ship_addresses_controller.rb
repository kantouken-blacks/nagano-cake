class ShipAddressesController < ApplicationController
  def index
    @ship_address_new = ShipAddress.new
    @ship_addresses = current_customer.ship_addresses
  end

  def create
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.customer_id = current_customer.id
    @ship_address.save
    redirect_to ship_addresses_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def ship_address_params
      params.require(:ship_address).permit(:last_name, :first_name, :post_code, :address)
  end
end
