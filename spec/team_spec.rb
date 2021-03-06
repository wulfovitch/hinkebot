require 'hinkebot'

describe Team do

  describe "#all" do
    it "should return 18 Teams" do
      teams = Team.all
      teams.size.should == 18
    end
  
    it "should return all 18 Team longnames" do
      Team.all_team_names.should include "FC Augsburg"
      Team.all_team_names.should include "Hertha BSC"
      Team.all_team_names.should include "SV Werder Bremen"
      Team.all_team_names.should include "Borussia Dortmund"
      Team.all_team_names.should include "SC Freiburg"
      Team.all_team_names.should include "Hamburger SV"
      Team.all_team_names.should include "Hannover 96"
      Team.all_team_names.should include "TSG 1899 Hoffenheim"
      Team.all_team_names.should include "Eintracht Frankfurt"
      Team.all_team_names.should include "Eintracht Braunschweig"
      Team.all_team_names.should include "Bayer 04 Leverkusen"
      Team.all_team_names.should include "1. FSV Mainz 05"
      Team.all_team_names.should include "Borussia Mönchengladbach"
      Team.all_team_names.should include "FC Bayern München"
      Team.all_team_names.should include "1. FC Nürnberg"
      Team.all_team_names.should include "FC Schalke 04"
      Team.all_team_names.should include "VfB Stuttgart"
      Team.all_team_names.should include "VfL Wolfsburg"
    end
  end 
  
  describe "#find_by_shortname" do
    it "should find a team" do
      bvb = Team.find_by_shortname Team::BVB
      bvb.name == "Borussia Dortmund"
      svw = Team.find_by_shortname Team::SVW
      svw.name == "Werder Bremen"
    end  
  end
  
  describe "#find_by_id" do
    it "should find a team" do
      bvb = Team.find_by_id 100
      bvb.name == "Hamburger SV"
      svw = Team.find_by_id 134
      svw.name == "Werder Bremen"
    end  
  end  
  
  describe "#aufsteiger?" do
    it "should return SpVgg Eintracht Braunschweig and Hertha BSC as aufsteiger teams" do
      fd = Team.find_by_shortname Team::BSC
      fd.aufsteiger?.should be_true
    
      ef = Team.find_by_shortname Team::EB
      ef.aufsteiger?.should be_true   
    end      
    
    it "should return Bayern München not as a aufsteiger team" do
      fcb = Team.find_by_shortname Team::FCB
      fcb.aufsteiger?.should be_false
    end
  end
  
  describe "#meister?" do
    it "should return Borussia Dortmund not as meister team" do
      bvb = Team.find_by_shortname Team::BVB
      bvb.meister?.should be_false
    end
    
    it "should return Bayern München as meister team" do
      fcb = Team.find_by_shortname Team::FCB
      fcb.meister?.should be_true
    end
  end
  
  describe "#last_season_position" do
    it "Borussia Dortmund should return '2' as position of the last season" do
      bvb = Team.find_by_shortname Team::BVB
      bvb.last_season_position.should == 2
    end
    
    it "Bayern München should return '1' as position of the last season" do
      fcb = Team.find_by_shortname Team::FCB
      fcb.last_season_position.should == 1
    end
    
    it "Werder Bremen should return '14' as position of the last season" do
      svw = Team.find_by_shortname Team::SVW
      svw.last_season_position.should == 14  
    end
    
    it "Eintracht Braunschweig and Hertha BSC should return nil as position of the last season" do
      fd = Team.find_by_shortname Team::BSC
      fd.last_season_position.should be_nil
      ef = Team.find_by_shortname Team::EB
      ef.last_season_position.should be_nil      
    end        
  end
  
end