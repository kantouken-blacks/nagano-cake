class OrderDetail < ApplicationRecord
	belongs_to :order
	enum item_status: [:着手不可, :製作待ち, :製作中, :製作完了]

  after_update do
    order_details = Order.find(order_id).order_details
    if order_details.all? {|order_detail| order_detail.item_status == "製作完了"} == true # 条件分岐：注文に紐付けられている注文詳細の製作ステータスが全て製作完了だったら
      Order.find(order_id).update(order_status: "発送準備中") # 注文ステータスを発送準備中に変更する
    end
  end
end
