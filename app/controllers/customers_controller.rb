class CustomersController < ApplicationController
  def edit
    # @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "You have edited user data successfully."
      redirect_to customers_path(@customer.id)
    else
      render 'edit'
    end
  end
end
