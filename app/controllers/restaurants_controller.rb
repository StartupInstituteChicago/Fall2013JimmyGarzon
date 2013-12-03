class RestaurantsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :credentials_filter, :only => [:edit, :destroy]

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		@restaurant.user = current_user

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@gmaps_key = ENV["GMAPS_API_KEY"]
		@can_edit = @restaurant.user == current_user
	end

	# def remove_star
	# 	@restaurant.stars.delete(current_user)
	# end

	# def add_star
	# 	@restaurant.stars << current_user
	# 	respond_to do |format|
	# 		format.html { redirect_to restaurants_path }
	# 		format.js
	# 	end
	# end

	def index
		@restaurants = Restaurant.find(:all)
		@gmaps_key = ENV["GMAPS_API_KEY"]
	end

	def edit
		@restaurant = Restaurant.find(params[:id])

	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(restaurant_params)
			redirect_to @restaurant
		else
			render 'edit'
		end

	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		redirect_to restaurants_path		
	end

	private
		def restaurant_params
			params.require(:restaurant).permit(:name, :description, :street, :city, :state, :zipcode, :phone, :image, :remote_image_url, :menu, :category_tokens, :category_ids => [])
		end

	def credentials_filter
		user = Restaurant.find(params[:id]).user
		unless user == current_user
			flash[:message] = "Please login with the appropiate credentials"
			redirect_to :root
		end
	end
end
