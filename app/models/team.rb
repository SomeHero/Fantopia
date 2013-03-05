class Team < ActiveRecord::Base
  attr_accessible :city_name, :league_id, :name, :primary_color, :second_color, :state_abbreviation, :team_name, :team_short_name
  belongs_to:league
end
