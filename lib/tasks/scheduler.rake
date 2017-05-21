desc "This task is called by the Heroku scheduler add-on"
task :rank_500_newest_stories => :environment do
  puts "Fetch and rank the newest 500 stories"
  StoryRankingService.new.rank_new_500_stories
  puts "done."
end
