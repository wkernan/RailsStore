class Cart < ApplicationRecord
	# dependent: :destroy means if we destroy a cart, we also will destroy all line_items associated with it
	has_many :line_items, dependent: :destroy
end
