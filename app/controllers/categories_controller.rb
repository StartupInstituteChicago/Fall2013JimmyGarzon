class CategoriesController < ApplicationController
	def index
		
		@categories = Category.where("name like ?", "%#{params[:q]}%")
		respond_to do |format|
			format.html
			format.json {render :json => @categories}
		end
	end
end
