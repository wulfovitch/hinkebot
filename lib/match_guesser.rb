class MatchGuesser
  
  def guess match
    return "2:1" if match.team1.aufsteiger? || match.team2.aufsteiger?
    last_saison_results = get_results_for_saison_and_teams "2011", match.team1, match.team2
    return "2:1" unless results_from_last_saison_valid? last_saison_results
    calculate_result_from_last_saison_result last_saison_results
  end
  
  def get_matches_for_match_day match_day
    json = Curl::Easy.perform("http://botliga.de/api/matches/2012").body_str
    all_matches = JSON.parse(json)
    
    matches = []
    all_matches.each do |match|
      if match["group"] == match_day
        matches << Match.new(match["id"], Team.find_by_id(match["hostId"]), Team.find_by_id(match["guestId"])) 
      end
    end
    matches
  end
  
  private
  
  def get_results_for_saison_and_teams saison, team1, team2
    query_url = "http://openligadb-json.heroku.com/api/matchdata_by_teams?team_id_1=#{team1.id}&team_id_2=#{team2.id}"
    puts query_url
    json = Curl::Easy.perform(query_url).body_str
    pp json
    matchdata = JSON.parse(json)

    results = []
    matchdata["matchdata"].each do |match|
      if match["league_saison"] == saison && match["league_shortcut"] == "bl1"
        match["match_results"]["match_result"].each do |match_results|
          if match_results["result_name"] == "Endergebnis"
            if match["id_team1"] == team1.id.to_s
              results << [match_results["points_team1"], match_results["points_team2"]] 
            else
              results << [match_results["points_team2"], match_results["points_team1"]]
            end
          end
        end  
      end
    end
    results
  end
  
  def results_from_last_saison_valid? results
    results.size == 2
  end
  
  def calculate_result_from_last_saison_result results
    home_goals = (results[0][0].to_i + results[1][0].to_i)/2
    guest_goals = (results[0][1].to_i + results[1][1].to_i)/2
    "#{home_goals}:#{guest_goals}"
  end
  
end