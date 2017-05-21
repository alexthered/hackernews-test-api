desc "This task is called by the Heroku scheduler add-on"
task :rank_500_newest_stories => :environment do
  puts "Fetch and rank the newest 500 stories"
  start_at = Time.now
  StoryRankingService.new.rank_new_500_stories
  complete_at = Time.now
  puts "DONE rank_500_newest_stores task. Elapsed time #{((complete_at - start_at) / 1.minute).round(1)} minutes."
end
