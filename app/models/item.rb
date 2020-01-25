class Item < ApplicationRecord
  validates :name, presence: true
	validates :description, presence: true
	validates :price, 		  presence: true
	validates :sale_status, presence: true
	# ！！with optionでまとめる！！
	has_many :cart_items, dependent: :destroy
	belongs_to :genre
	attachment :image
	enum sale_status: [['販売可',0],['販売不可',1]]
end
