class OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id:current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    @ship_addresses = current_customer.ship_addresses
    @ship_address = ShipAddress.new
    @order = Order.new
  end

  #情報入力画面でボタンを押して情報をsessionに保存
  def create
    session[:payment] = params[:payment]
    if params[:select] == "select_address"
      session[:address] = params[:address]
    elsif params[:select] == "my_address"
      session[:address] ="〒" +current_customer.post_code+current_customer.address+current_customer.last_name+current_customer.first_name
    end
    if session[:address].present? && session[:payment].present?
      redirect_to orders_confirm_path
    else
      flash[:order_new] = "支払い方法と配送先を選択して下さい"
      redirect_to new_order_path
    end




  end
  # 購入確認画面
  def confirm
      @orders = current_customer.orders
      @total_price = calculate(current_customer)

      if  session[:address].length <8
        @address = ShipAddress.find(session[:address])
      end
  end

  # 情報入力画面にて新規配送先の登録
  def create_ship_address
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.customer_id = current_customer.id
    @ship_address.save
    redirect_to new_order_path
  end


  def create_order
    # オーダーの保存
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.address = session[:address]
    @order.payment = session[:payment]
    @order.total_price = calculate(current_customer)
    @order.order_status = 0
    @order.save
    # saveができた段階でOrderモデルにorder_idが入る

    # オーダー商品ごとの詳細の保存
    current_customer.cart_items.each do |cart|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_name = cart.item.name
      @order_detail.item_price = cart.item.price
      @order_detail.quantity = cart.quantity
      @order_detail.item_status = 0
      @order_detail.save

    end
    current_customer.cart_items.destroy_all
    session.delete(:address)
    session.delete(:payment)
    redirect_to thanks_path
  end

  private
   def ship_address_params
     params.require(:ship_address).permit(:customer_id,:last_name, :first_name, :post_code, :address)
   end
   def order_params
     params.require(:order).permit(:customer_id, :address, :payment, :carriage, :total_price, :order_status)
   end

   # 商品合計（税込）の計算
   def calculate(user)
     total_price = 0
     user.cart_items.each do |cart_item|
       total_price += cart_item.quantity * cart_item.item.price
     end
     return (total_price * 1.1).floor
   end

end
