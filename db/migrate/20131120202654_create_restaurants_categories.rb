class CreateRestaurantsCategories < ActiveRecord::Migration
  def change
    create_table :restaurants_categories, :id => false do |t|
      t.references :category
      t.references :restaurant
    end
  end
end
