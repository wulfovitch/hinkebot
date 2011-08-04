$LOAD_PATH << File.expand_path('../lib/', __FILE__)
require 'hinkebot'

#Bot.new.post_guesses_for_season_2010_2011

#def results_of_last_saison
#json = File.read('lib/bla.json')


#pp get_results_from_saison_2010(Team.find_by_shortname(Team::SVW), Team.find_by_shortname(Team::S04))

#match_guesser = MatchGuesser.new
#pp match_guesser.get_matches 1

Bot.new.post_guesses_for_match_day 1