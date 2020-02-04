class CartItem < ApplicationRecord
   # エラー
   validates :quantity, presence: true
   # 数量0以下に変更して保存されないように
   belongs_to :customer
   belongs_to :item

   def validate_into_cart
      cart_items = Customer.find(customer_id).cart_items
      if (quantity) == nil
         return (false)
      elsif cart_items.any? {|cart_item| cart_item.item_id == (item_id)} == true
         return (false)
      else
        return (true)
      end
   end
end
