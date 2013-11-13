class RestaurantsController < ApplicationController

	before_filter :authenticate_owner!

	def new
		@restaurant = Restaurant.new
		#reservation = @restaurant.reservations.build
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		@restaurant.owner = current_owner
		#reservation = @restaurant.reservations.build


		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@gmaps_key = ENV["GMAPS_API_KEY"]
	end


	def index
		@restaurants = Restaurant.find(:all)
		@gmaps_key = ENV["GMAPS_API_KEY"]
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		unless @restaurant.owner == current_owner
			flash[:message] = "Please login with the appropiate credentials"
			redirect_to @restaurant
		end
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
			params.require(:restaurant).permit(:name, :description, :street, :city, :state, :zipcode, :phone, :image, :remote_image_url, :menu)
		end
end
