class OrderDetail < ApplicationRecord
	belongs_to :order
	enum item_status: [:着手不可, :製作待ち, :製作中, :製作完了]
end
