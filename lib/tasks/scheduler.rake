desc "This task is called by the Heroku scheduler add-on"
task :rank_500_newest_stories => :environment do
  puts "Fetch and rank the newest 500 stories"
  start_at = Time.now
  StoryRankingService.new.rank_new_500_stories
  complete_at = Time.now
  
  duration = ((complete_at - start_at) / 1.minute).round(1)
  puts "DONE rank_500_newest_stores task. Elapsed time #{duration} minutes."
end
