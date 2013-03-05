class GameLocation < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :name, :state_abbreviation, :street_address, :zip
end
