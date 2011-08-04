require 'rubygems'
require 'curb'

class Bot
  
  attr_writer :connection
  attr_writer :succussful
  BOTLIGA_API_TOKEN = File.open(File.expand_path('~/.botliga_api_key_1')) { |file| file.readline }
  
  def post_guesses_for_match_day match_day
    match_guesser = MatchGuesser.new
    matches = match_guesser.get_matches_for_match_day match_day
    matches.each do |match|
      guess = match_guesser.guess match
      pp "#{guess} - #{match.team1.name} vs. #{match.team2.name}"
      post_guess match.id, guess
    end
  end  
  
  def post_guess match_id, result

      params = [Curl::PostField.content('match_id', match_id),
                Curl::PostField.content('result', result),
                Curl::PostField.content('token', BOTLIGA_API_TOKEN)]
    
      @connection = Curl::Easy.new("http://botliga.de/api/guess")
      @succussful = @connection.http_post("http://botliga.de/api/guess", params)
  end
  
  def tip_successful_submitted?
    @succussful
  end
  
end