class RestaurantsController < ApplicationController
	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		
		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@full_address = @restaurant.street + ' ' + @restaurant.city + ' ' +@restaurant.state + ' ' + @restaurant.zipcode
		@gmaps_key = ENV["GMAPS_API_KEY"]
	end


	def index
		@restaurants = Restaurant.find(:all)
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(params[:restaurant].permit(:name, :description, :street, :city, :state, :zipcode, :phone, :image, :remote_image_url, :menu))
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
