class CustomersController < ApplicationController
  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "You have edited user data successfully."
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

    def withdrow #退会画面を表示するアクション
       @customer = Customer.find(params[:id])
    end

    def switch
       @customer = Customer.find(params[:id])
       if @customer.update(is_enabled: false)
          sign_out current_customer #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
       end
       redirect_to root_path
    end



  private
  def customer_params
  	  params.require(:customer).permit(:is_enabled, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :phone_number, :email, :password, :post_code, :address)
  end

end