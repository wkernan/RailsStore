class Product < ApplicationRecord
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'Must be a URL for .gif, .jpg or .png image.'
	}
	validates :title, length: { minimum: 10, message: "not allowed! %{value} is too short, 10 character minimum." }

	private
		# ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
			# if line_items is not empty run the block, if it is empty, than proceed to destroy
			unless line_items.empty?
				errors.add(:base, 'Line Items present')
				throw :abort
			end
		end
end
