require 'spec_helper'

describe RestaurantsController do
	describe "PUT update" do
		before(:each) do 
			@restaurant = FactoryGirl.create(:restaurant)
		end

		it "should update restaurant properties" do
			put :update, {id: 10}
			expect(@restaurant.name).to eq "Wendys" 

		end

		it "should create reservation" do

		end

	end
end