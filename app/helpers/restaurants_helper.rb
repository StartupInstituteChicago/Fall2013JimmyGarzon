require 'uri'
module RestaurantsHelper
	def gmap_url(restaurant)
		url = "http://maps.googleapis.com/maps/api/staticmap?"
		url << "center=" + URI.escape(restaurant.full_address)
		url << "&markers=" + "color:red|" + URI.escape(restaurant.full_address)
		url << "&zoom=14"
		url << "&size=200x200"
		url << "&sensor=false"
		url << "&key=#{@gmaps_key}"
	end
end
