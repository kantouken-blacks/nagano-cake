class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    if params[:order_id]
      order_detail = OrderDetail.find(params[:id])
      order_detail.update(order_detail_params)
      redirect_to admin_order_path(order_detail.order_id)
    else
      order = Order.find(params[:id])
      order.update(order_params)
      redirect_to admin_order_path(order)
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

