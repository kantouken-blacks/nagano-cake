class Admin::CustomerDatasController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    # binding.pry
    if @customer.update(customer_params)
      redirect_to admin_customer_data_path
    else
      redirect_to edit_admin_customer_data_path(@customer)
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_enabled)
  end
end
