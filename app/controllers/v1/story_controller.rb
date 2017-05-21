class V1::StoryController < ApplicationController
  
  api :GET, "/stories", "Get the top 10 stories with the highest ranking"
  description  <<-EOS
  This will return the list of 10 stories with highest average score over time
  EOS
  def index
    @stories = StoryRankingService.new.get_top_10_stories
  end
  

end
