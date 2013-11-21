require 'spec_helper'

describe ReservationsController do
 it "responds to create" do
 	total_reservations = Reservation.count #faster than Reservation.all.count
 	post :create, {:email => "me@example.com", :message => "Test Reservation", :requested_date => Time.now }
 	expect(Reservation.count).to eq total_reservations + 1
 end

end
