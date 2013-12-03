class Restaurant < ActiveRecord::Base
	validates_presence_of :name
	mount_uploader :image, ImageUploader
	mount_uploader :menu, MenuUploader

	belongs_to :user
	has_many :reservations, :dependent => :destroy
	has_many :stars
	has_many :starred_by, through: :stars, source: :user

	accepts_nested_attributes_for :reservations
  
  has_and_belongs_to_many :categories

	validates_presence_of :name, :user_id

	def full_address
		self.street + ' ' + self.city + ' ' +self.state + ' ' + self.zipcode
	end

	attr_reader :category_tokens

	def category_tokens=(ids)
		self.category_ids = ids.split(",")
	end



end
