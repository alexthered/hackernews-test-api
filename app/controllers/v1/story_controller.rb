class V1::StoryController < ApplicationController
  
  api :GET, "/stories", "Get the top 10 stories with the highest ranking"
  description  <<-EOS
  This will return the list of 10 stories with highest average score over time
  EOS
  def index
    @stories = StoryRankingService.new.get_top_10_stories
  end
  
  api :GET, "/stories/top", "Get the lifetime top story which has highest average score over time"
  description  <<-EOS
  This will return the lifetime top story which has highest average score over time
  Sample response:
  {
    "id": 14388742,
    "score": 1,
    "title": "Example Web-App with Go, MongoDB, VueJS2",
    "url": "https://github.com/malisit/munhasir",
    "descendants": 0,
    "avg_score_over_time": 114.9,
    "by": "masit",
    "lifetime": "1 minutes"
  }
  EOS
  def get_lifetime_top_story
    @story = StoryRankingService.new.get_lifetime_top_story

    render partial: 'v1/story/story', locals: {story: @story}, status: 200
  end
  

end
