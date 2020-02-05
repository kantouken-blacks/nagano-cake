class ShipAddressesController < ApplicationController
  def index
    @ship_address_new = ShipAddress.new
    @ship_addresses = current_customer.ship_addresses
  end

  def create
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.customer_id = current_customer.id
    if @ship_address.save
       redirect_to ship_addresses_path
    else
       @ship_address_new = ShipAddress.new
       @ship_addresses = current_customer.ship_addresses
       render :index
    end
  end

  def edit
    @ship_address = ShipAddress.find(params[:id])
  end

  def update
    ship_address = ShipAddress.find(params[:id])
    ship_address.update(ship_address_params)
    redirect_to ship_addresses_path
  end

  def destroy
    ship_address = ShipAddress.find(params[:id])
    ship_address.destroy
    redirect_to ship_addresses_path
  end

  private
  def ship_address_params
      params.require(:ship_address).permit(:last_name, :first_name, :post_code, :address)
  end
end
