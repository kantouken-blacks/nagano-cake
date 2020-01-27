class ShipAddressesController < ApplicationController
  def index
    @shipaddress = Shipaddress.new
    @shipaddress = Shipaddress.find(params[:id])
    @shipaddresses = @customer.shipaddress
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
