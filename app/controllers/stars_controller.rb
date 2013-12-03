class StarsController < ApplicationController
	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@star = Star.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@star = @restaurant.stars.new
    	@star.user_id = current_user.id
		
		if @star.save
			respond_to do |format|
      		#flash[:notice] = "You have successfully starred this restaurant"
      		format.html { redirect_to restaurant_path(@restaurant) }
      		format.js
  			end
    	else
      		render 'star_restaurant'
    	end
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
    	@star = Star.find(params[:id])
    	@star.destroy
    	respond_to do |format|
          #flash[:notice] = "You have successfully unstarred this restaurant"
          format.html {redirect_to restaurant_path(@restaurant)}
          format.js
        end
  end


end
