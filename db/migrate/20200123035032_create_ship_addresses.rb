class CreateShipAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_addresses do |t|
      t.integer :customer_id    null: false, default: ""
      # 外部キー 会員のID
      t.string  :last_name      null: false, default: ""
      t.string  :first_name     null: false, default: ""
      t.string  :post_code      null: false, default: ""
      t.text    :address        null: false, default: ""

      t.timestamps
    end
  end
end
