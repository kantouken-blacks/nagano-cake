class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer  :customer_id     null: false, default: ""
      t.string   :last_name       null: false, default: ""
      t.string   :first_name      null: false, default: ""
      t.string   :post_code       null: false, default: ""
      t.text     :address         null: false, default: ""
      t.integer  :payment         null: false, default: ""
      # e_num設定 ０= クレジットカード、１= 銀行振込
      t.integer  :carriage        null: false, default: 800
      t.integer  :total_price     null: false
      # Viewで表示された小計に送料(carriage)をプラスして格納する
      t.integer  :order_status　 　null: false, default: 0
      # e_num設定 ０= 入金待ち、１= 入金確認、２= 製作中、３= 発送準備中、４= 発送済み 登録時は0(入金待ち)
      # ？？？製作ステータスとのオート機能はモデルで設定するわけではないのか？？？
      t.timestamps
    end
  end
end
