class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)

  	def counter
  		session[:counter] ||= 0
  		session[:counter] += 1
  	end

  	@counter = counter
  end
end
