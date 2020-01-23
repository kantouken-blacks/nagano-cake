class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id	null: false, default: ""
      # 外部キー 会員のID
      t.integer :item_id		null: false, default: ""
      # 外部キー 商品のID
      t.integer :quantity		null: false, default: ""

      t.timestamps
    end
  end
end
