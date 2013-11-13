class Restaurant < ActiveRecord::Base
	validates_presence_of :name
	mount_uploader :image, ImageUploader
	mount_uploader :menu, MenuUploader

	belongs_to :owner
	has_many :reservations, :dependent => :destroy
	accepts_nested_attributes_for :reservations

	validates_presence_of :name, :owner_id

	def full_address
		self.street + ' ' + self.city + ' ' +self.state + ' ' + self.zipcode
	end
end
