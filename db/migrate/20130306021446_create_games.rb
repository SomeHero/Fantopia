class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :league_id
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :game_location_id
      t.datetime :game_date

      t.timestamps
    end
  end
end
