class Match
  attr_reader :id
  attr_reader :team1
  attr_reader :team2  
  
  def initialize id, team1, team2
    @id = id
    @team1 = team1
    @team2 = team2
  end
end