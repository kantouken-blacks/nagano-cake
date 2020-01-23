class CartItem < ApplicationRecord
   validates :quantity, numericality: {grater_than :0}
   # 数量0以下に変更して保存されないように
   belongs_to :customer
   belongs_to :items
   #？？？上の場合は記述をまとめることできる？？？
end
