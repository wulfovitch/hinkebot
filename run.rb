$LOAD_PATH << File.expand_path('../lib/', __FILE__)
require 'hinkebot'

#(1..34).each do |match_day|
#  pp "Guessing Results for match day: #{match_day}"
#  Bot.new.post_guesses_for_match_day match_day
#  pp "---"
#end

Bot.new.post_guesses_for_match_day 1

