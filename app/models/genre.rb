class Genre < ApplicationRecord
	validates :name, presence: true
	has_many :items

	after_update do
		if (is_enabled) == false
			self.items.each {|item|
				item.update(sale_status: "販売不可")
			}
		end
	end
end
