class DropRestaurantsCategories < ActiveRecord::Migration
  def change
  	drop_table :restaurants_categories
  end
end
