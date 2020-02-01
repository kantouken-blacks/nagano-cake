class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all

    # 商品合計の算出
    @items_total_price = 0
    @order_details.each {|order_detail|
    tax_in_price = (order_detail.item_price * 1.1).floor
    sub_total_price = tax_in_price * order_detail.quantity
    @items_total_price += sub_total_price
    }
  end

  def update
    if params[:order_id] # 条件分岐：order_detailが更新されたら
      order_detail = OrderDetail.find(params[:id])
      order_details = Order.find(params[:order_id]).order_details
      order_detail.update(order_detail_params)
      if order_details.all? {|order_detail| order_detail.item_status == "製作完了"} == true # 条件分岐：注文に紐付けられている注文詳細の製作ステータスが全て製作完了だったら
        order_detail.order.update(order_status: "発送準備中") # 注文ステータスを発送準備中に変更する
      end
      redirect_to admin_order_path(order_detail.order_id)

    else
      order = Order.find(params[:id])
      order.update(order_params)
        if params[:order][:order_status] == "入金確認" # 条件分岐：注文ステータスが"入金確認"だったら
          order.order_details.each {|order_detail|
          order_detail.update(item_status: "製作待ち")
          }
        end
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

