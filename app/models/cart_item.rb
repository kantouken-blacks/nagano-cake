class CartItem < ApplicationRecord
   # エラー
   # validates :quantity, numericality: {grater_than :0}
   # 数量0以下に変更して保存されないように
   belongs_to :customer
   belongs_to :item
end
