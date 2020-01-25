class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string  :name        null: false, default: ""
<<<<<<< HEAD
      t.boolean :is_enabled default: true, null: false
      # 商品の有効/無効 TRUE =有効 FALSE =無効 初期では無効設定
=======
      t.boolean :is_enabled  default: true, null: false
      # 商品の有効/無効 TRUE =有効　FALSE =無効　初期では無効設定
>>>>>>> 5f38f84171ae66d7c5e46fe9461850fe24b76f79
      t.timestamps
    end
  end
end
