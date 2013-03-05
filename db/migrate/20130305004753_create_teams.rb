class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :league_id
      t.string :name
      t.string :team_name
      t.string :team_short_name
      t.string :city_name
      t.string :state_abbreviation
      t.string :primary_color
      t.string :second_color

      t.timestamps
    end
  end
end
