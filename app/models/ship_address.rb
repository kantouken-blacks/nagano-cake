class ShipAddress < ApplicationRecord
   validates :last_name,  presence: true
   validates :first_name, presence: true
   validates :post_code,  presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
   # 郵便番号のフォーマット指定 ３桁の数字 + ハイフン + ４桁の数字 Viewのフォーム設定
   validates :address, presence: true
   belongs_to :customer
end
