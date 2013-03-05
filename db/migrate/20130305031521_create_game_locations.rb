class CreateGameLocations < ActiveRecord::Migration
  def change
    create_table :game_locations do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state_abbreviation
      t.string :zip
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
