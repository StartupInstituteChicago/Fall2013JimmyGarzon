class UsersController < ApplicationController
  def dashboard
  	#@restaurants = Restaurant.find_by_user_id(current_user) #this is the old way
  	@restaurants = Restaurant.where(:user => current_user) #using active relations, read about 'like'
  	@starred_by_user = Star.where(:user_id => current_user)
  end
end