class Team
  
  FCA = 'fca'
  BSC = 'bsc'
  SVW = 'svw'
  BVB = 'bvb'
  SCF = 'scf'
  HSV = 'hsv'
  H96 = 'h96'
  TSG = 'tsg'
  FCK = 'fck'
  EFFZEH = 'effzeh'
  B04 = 'b04'
  FSV = 'fsv'
  BMG = 'bmg'
  FCB = 'fcb'
  FCN = 'fcn'
  S04 = 's04'
  VFB = 'vfb'
  VFL = 'vfl'
  
  attr_reader :name
  attr_reader :shortname
  attr_reader :last_season_position
  attr_reader :aufsteiger
  attr_reader :meister
  
  @@all_teams = []
  
  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
  
  def self.all
    return @@all_teams unless @@all_teams.empty?
    @@all_teams << Team.new(:name => "FC Augsburg", :shortname => FCA, :aufsteiger => true, :meister => false, :last_season_position => nil)
    @@all_teams << Team.new(:name => "Hertha BSC Berlin", :shortname => BSC, :aufsteiger => true, :meister => false, :last_season_position => nil)
    @@all_teams << Team.new(:name => "SV Werder Bremen", :shortname => SVW, :aufsteiger => false, :meister => false, :last_season_position => 13)
    @@all_teams << Team.new(:name => "Borussia Dortmund", :shortname => BVB, :aufsteiger => false, :meister => true, :last_season_position => 1)
    @@all_teams << Team.new(:name => "SC Freiburg", :shortname => SCF, :aufsteiger => false, :meister => false, :last_season_position => 9)
    @@all_teams << Team.new(:name => "Hamburger SV", :shortname => HSV, :aufsteiger => false, :meister => false, :last_season_position => 8)
    @@all_teams << Team.new(:name => "Hannover 96", :shortname => H96, :aufsteiger => false, :meister => false, :last_season_position => 4)
    @@all_teams << Team.new(:name => "TSG 1899 Hoffenheim", :shortname => TSG, :aufsteiger => false, :meister => false, :last_season_position => 11)
    @@all_teams << Team.new(:name => "1. FC Kaiserslautern", :shortname => FCK, :aufsteiger => false, :meister => false, :last_season_position => 7)
    @@all_teams << Team.new(:name => "1. FC Köln", :shortname => EFFZEH, :aufsteiger => false, :meister => false, :last_season_position => 10)
    @@all_teams << Team.new(:name => "Bayer 04 Leverkusen", :shortname => B04, :aufsteiger => false, :meister => false, :last_season_position => 2)
    @@all_teams << Team.new(:name => "1. FSV Mainz 05", :shortname => FSV, :aufsteiger => false, :meister => false, :last_season_position => 5)
    @@all_teams << Team.new(:name => "Borussia Mönchengladbach", :shortname => BMG, :aufsteiger => false, :meister => false, :last_season_position => 16)
    @@all_teams << Team.new(:name => "FC Bayern München", :shortname => FCB, :aufsteiger => false, :meister => false, :last_season_position => 3)
    @@all_teams << Team.new(:name => "1. FC Nürnberg", :shortname => FCN, :aufsteiger => false, :meister => false, :last_season_position => 6)
    @@all_teams << Team.new(:name => "FC Schalke 04", :shortname => S04, :aufsteiger => false, :meister => false, :last_season_position => 14)
    @@all_teams << Team.new(:name => "VfB Stuttgart", :shortname => VFB, :aufsteiger => false, :meister => false, :last_season_position => 12)
    @@all_teams << Team.new(:name => "VfL Wolfsburg", :shortname => VFL, :aufsteiger => false, :meister => false, :last_season_position => 15)
    @@all_teams
  end
  
  def self.find_by_shortname shortname
    all.each { |team| return team if team.shortname == shortname }
  end
  
  def self.all_team_names
    team_names = []
    all.each { |team| team_names << team.name }
    team_names
  end
  
  def aufsteiger?
    @aufsteiger == true
  end
  
  def meister?
    @meister == true
  end
  
  def last_season_position
    @last_season_position
  end    
end