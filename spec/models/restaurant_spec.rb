require 'spec_helper'

describe Restaurant do
	describe "full_adress" do
		it "concatenates the address fields" do
			restaurant = FactoryGirl.build(:restaurant)

			expect(restaurant.full_address).to eq "1 Main Springfield IL 60452"

		end
end
	
end