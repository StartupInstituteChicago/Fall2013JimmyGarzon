class Restaurant < ActiveRecord::Base
	validates_presence_of :name
	mount_uploader :image, ImageUploader
	mount_uploader :menu, MenuUploader

	def full_address
		self.street + ' ' + self.city + ' ' +self.state + ' ' + self.zipcode
	end
end
