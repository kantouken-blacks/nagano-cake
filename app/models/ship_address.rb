class ShipAddress < ApplicationRecord
   validates :last_name,  presence: true
   validates :first_name, presence: true
   validates :post_code,  presence: true, format: {with: /\A\d{7}\z/}
   # 郵便番号のフォーマット指定 ハイフン無し７桁固定 Viewのフォーム設定
   validates :address, presence: true
   belongs_to :customer
end
