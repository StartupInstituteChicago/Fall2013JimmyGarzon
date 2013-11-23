class CategoriesController < ApplicationController
	def index
		@categories = Category.all

		@categories = Category.where("name like ?", "%#{params[:q]}%")
		respond_to do |format|
			format.html
			format.json {render :json => @categories}
		end

	end

	def show
		@category = Category.find(params[:id])
	end

	# def search
	# 	arr = [1,2]
	# 	rs = Restaurant.joins(:categories).where(:categories => {:id => arr.sort})
	# 	@list = rs.find_all{|r| r.categories.map(&:id) == arr.sort}
	# 	@list.uniq
	# end


end
