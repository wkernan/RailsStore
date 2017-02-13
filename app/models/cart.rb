class Cart < ApplicationRecord
	# dependent: :destroy means if we destroy a cart, we also will destroy all line_items associated with it
	has_many :line_items, dependent: :destroy

	def add_product(product)
		current_item = line_items.find_by(product_id: product.id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product.id)
		end
		current_item
	end
end
