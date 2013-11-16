class ReservationsController < ApplicationController
	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new(reservation_params)

		if @reservation.save
			ReservationMailer.send_reservation_email(@reservation).deliver

			redirect_to restaurant_reservation_path(@reservation.restaurant_id, @reservation.id)
		else
			render 'new'
		end
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

    def update #not working!
        @reservation = Reservation.find(params[:id])
        if @reservation.update(reservation_params)
                redirect_to @reservation
        else
                render "edit"
        end
    end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def index
		@restaurant = Restaurant.find(params[:restaurant_id])
        if owner_signed_in? and current_owner == @restaurant.owner
        	@reservations = @restaurant.reservations
        else
            flash[:notice] = "You are not authorized for this action"
            redirect_to restaurants_path
        end	
	end


	private
		def reservation_params
			params.require(:reservation).permit(:email, :requested_date, :message)
		end

end
