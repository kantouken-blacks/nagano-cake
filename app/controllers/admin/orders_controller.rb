class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @items_total_price = calculate(@order)
  end

  def calculate(items_total_price) # 商品合計を算出するメソッド
    @items_total_price = 0
    @order_details.each {|order_detail|
    tax_in_price = (order_detail.item_price * 1.1).floor
    sub_total_price = tax_in_price * order_detail.quantity
    @items_total_price += sub_total_price
    }
    return @items_total_price
  end

  def update
    if params[:order_id] # 条件分岐：order_detailが更新されたら
      order_detail = OrderDetail.find(params[:id])
      order_detail.update(order_detail_params)
      # OrderDetailModel after_update => 注文ステータスの自動更新
      redirect_to admin_order_path(order_detail.order_id)

    else
      order = Order.find(params[:id])
      order.update(order_params)
      # OrderModel after_update => 製作ステータスの自動変更
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

