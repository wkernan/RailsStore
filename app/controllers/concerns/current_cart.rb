module CurrentCart
	private
	# private method on Cart class - set cart by looking at session[:cart_id] if it exists
	# if not, create a new cart setting session[:cart_id] from created cart.id
		def set_cart
			@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			@cart = Cart.create
			session[:cart_id] = @cart.id 
		end
end