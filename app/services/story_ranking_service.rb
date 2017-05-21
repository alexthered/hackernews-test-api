class StoryRankingService
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0/'
  
  def get_top_10_stories
    return RedisWrapper.new.get_last_10_stories
  end
  
  def fetch_stories
    newest_500_ids = get_500_new_stories
  
    newest_500 = []
    newest_500.each do |id|
      newest_500 << get_story_item(id)
    end
  
    #rank the retrieved story by its avg_score_over_time
    newest_500.sort_by!{ |story| story.avg_score_over_time }
  
    RedisWrapper.new.push_stories(newest_500)
  end
  

  private
    def get_500_new_stories
      JSON.parse(self.class.get("/newstories.json").body)
    end
  
    def get_story_item item_id
      params = JSON.parse(self.class.get("/item/#{item_id}.json").body)
      
      # initialize new story item
      @item = Story.new(params)
    end
  
end