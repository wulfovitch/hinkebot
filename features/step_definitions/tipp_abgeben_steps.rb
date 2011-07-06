Given /^ein Bot$/ do
  @bot = Bot.new
end

When /^der Bot Kontakt zum BotLiga Service aufnimmt$/ do
  @bot.post_guess '9998', MatchGuesser.guess
end

Then /^sollte das Ergebnis korrekt eingetragen worden sein$/ do
  @bot.tip_successful_submitted?.should == true
end

