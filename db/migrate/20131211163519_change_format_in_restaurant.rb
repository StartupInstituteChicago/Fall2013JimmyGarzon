class ChangeFormatInRestaurant < ActiveRecord::Migration
  def change
  	change_column :restaurants, :monday_open_at, :time
    change_column :restaurants, :monday_close_at, :time
    change_column :restaurants, :tuesday_open_at, :time
    change_column :restaurants, :tuesday_close_at, :time
    change_column :restaurants, :wednesday_open_at, :time
    change_column :restaurants, :wednesday_close_at, :time
    change_column :restaurants, :thursday_open_at, :time
    change_column :restaurants, :thursday_close_at, :time
    change_column :restaurants, :friday_open_at, :time
    change_column :restaurants, :friday_close_at, :time
    change_column :restaurants, :saturday_open_at, :time
    change_column :restaurants, :saturday_close_at, :time
    change_column :restaurants, :sunday_open_at, :time
    change_column :restaurants, :sunday_close_at, :time
  end
end
