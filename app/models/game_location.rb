class GameLocation < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :name, :state_abbreviation, :street_address, :zip

  # generate the game location
  def to_api

    results = {
      'game_location_id' => id,
      'name' => name,
      'street_address' => street_address,
      'city' => city,
      'state_abbreviation' => state_abbreviation,
      'zip' => zip,
      'latitude' => latitude,
      'longitude' => longitude
    }

    return results;

  end
end
