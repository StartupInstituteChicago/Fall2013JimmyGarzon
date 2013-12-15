require 'uri'
module RestaurantsHelper
	def gmap_url(restaurant)
		url = "http://maps.googleapis.com/maps/api/staticmap?"
		url << "center=" + URI.escape(restaurant.full_address)
		url << "&markers=" + "color:red|" + URI.escape(restaurant.full_address)
		url << "&zoom=14"
		url << "&size=200x200"
		url << "&sensor=false"
		url << "&key=#{ ENV['GMAPS_API_KEY'] }"
		return url
	end

	def all_restaurants_gmap(restaurants)
		url = "http://maps.googleapis.com/maps/api/staticmap?"
		url << "center=" + URI.escape(@restaurants.first.zipcode)
		url << "&zoom=14"
		url << "&size=400x400"
		url << "&sensor=false"
		url << "&key=#{ ENV['GMAPS_API_KEY'] }"
		url << "&markers=color:red"

		@restaurants.each do |restaurant|
			url << '|' + "#{url_encode(restaurant.full_address)}" unless restaurant.full_address == ""
		end

		return url
	end

end