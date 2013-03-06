class League < ActiveRecord::Base
  attr_accessible :abbreviation, :name
  has_many :teams

  #get the league
  def get_league
    league = League.includes(:teams).all
    
    return league
  end


  # generate the league
  def to_api()

    result = {
    	'name' => name,
    	'abbreviation' => abbreviation
    }
    result[:teams] = []

    self.teams.each do |team|
        result[:teams] << team.to_api()
    end
    
    return result
  end
end
