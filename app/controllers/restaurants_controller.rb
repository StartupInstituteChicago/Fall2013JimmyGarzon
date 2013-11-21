class RestaurantsController < ApplicationController

	before_filter :authenticate_owner!
	before_filter :credentials_filter, :only => [:edit, :destroy]

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		@restaurant.owner = current_owner


		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@gmaps_key = ENV["GMAPS_API_KEY"]

		@can_edit = @restaurant.owner == current_owner

	end


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
			params.require(:restaurant).permit(:name, :description, :street, :city, :state, :zipcode, :phone, :image, :remote_image_url, :menu, :category_ids => [])
		end

	def credentials_filter
		owner = Restaurant.find(params[:id]).owner
		unless owner == current_owner
			flash[:message] = "Please login with the appropiate credentials"
			redirect_to :root
		end
	end
end
