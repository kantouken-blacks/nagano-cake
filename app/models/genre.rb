class Genre < ApplicationRecord
	validates :name, presence: true
	has_many :items

	after_update do
		items = Genre.find(id).items
		if (is_enabled) == true
			items.each {|item|
				item.update(sale_status: "販売不可")
			}
		end
	end
end
