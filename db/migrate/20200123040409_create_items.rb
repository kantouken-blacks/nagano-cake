class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer  :genre_id,    index: true, null: false, default: ""
      # 外部キー 商品ジャンルのID
      t.string   :image_id
      t.string   :name,        null: false, default: ""
      t.text     :description
      t.integer  :price,       null: false, default: ""
      t.integer  :sale_status, null: false, default: 1
      # e_num設定 ０ = 販売可、１ = 販売不可　登録時は販売不可

      t.timestamps
    end
  end
end
