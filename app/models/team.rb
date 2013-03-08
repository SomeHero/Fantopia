class Team < ActiveRecord::Base
  attr_accessible :city_name, :league_id, :name, :primary_color, :second_color, :state_abbreviation, :team_name, :team_short_name
  belongs_to:League, :class_name => "League"

  # generate the team
  def to_api

    results = {
      'team_id' => id,
      'league_id' => league_id,
      'name' => name,
      'team_name' => team_name,
      'team_short_name' => team_short_name,
      'city_name' => city_name,
      'state_abbreviation' => state_abbreviation,
      'primary_color' => primary_color,
      'secondary_color' => second_color
    }

    return results;

  end

end
