class Game < ActiveRecord::Base
  attr_accessible :away_team_id, :game_date, :game_location_id, :home_team_id, :league_id
  belongs_to:league
  belongs_to:game_location
  belongs_to:away_team, :class_name => "Team"
  belongs_to:home_team, :class_name => "Team"

   # generate the game
  def to_api

    results = {
      'game_id' => id,
      'league' => league.to_api,
      'away_team' => away_team.to_api,
      'home_team' => home_team.to_api,
      'game_date' => game_date,
      'game_location' => game_location.to_api
    }

    return results;

  end

end
