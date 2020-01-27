class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = Order_detail.find(params[:id])
    @order_details = @order.order_details
  end

  def new
  end

  def create
  end
end
