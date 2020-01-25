class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer  :order_id,    null: false, default: ""
      t.string   :item_name,   null: false, default: ""
      t.integer  :item_price,  null: false, default: ""
      t.integer  :quantity,    null: false, default: ""
      t.integer  :item_status, null: false, default: 0
      # e num設定 ０= 着手不可、１= 製作待ち、２= 製作中、３= 製作完了 初期値は0(着手不可)
      # ？？？注文ステータスとのオート機能はモデルで設定するわけではないのか？？？
      t.timestamps
    end
  end
end
