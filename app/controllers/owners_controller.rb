class OwnersController < ApplicationController
  def dashboard
  	#@restaurants = Restaurant.find_by_owner_id(current_owner) #this is the old way
  	@restaurants = Restaurant.where(:owner => current_owner) #using active relations, read about 'like'
  end
end