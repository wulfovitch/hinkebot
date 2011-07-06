require 'rubygems'
require 'curb'

class Bot
  
  attr_writer :connection
  attr_writer :succussful
  BOTLIGA_API_TOKEN = File.open(File.expand_path('~/.botliga_api_key_1')) { |file| file.readline }
  
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
  
  def post_guesses_for_season_2010_2011
    (9998..10303).each do |match_id|
      post_guess match_id, MatchGuesser.guess
    end
  end
  
end