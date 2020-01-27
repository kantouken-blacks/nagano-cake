class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.find(params[:order])
  end

  def update
    @order = Order.find(params[:id])
    @order_detail = order.find(paras[:id])
    if @order.update(order_params)
      redirect_to admin_order(@order)
    elsif
      @order_detail.update(order_detail_params)
      redirect_to admin_order(@order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_status)
  end
end
