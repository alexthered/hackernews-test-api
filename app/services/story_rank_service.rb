class StoryRankService
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0/'
  
  def get_top_10_stories
    top_500_ids = get_500_new_stories
    
    top_500 = []
    top_500_ids.each do |id|
      top_500 << get_story_item(id)
    end
    
    #rank the retrieved story by its avg_score_over_time
    top_500.sort_by!{ |story| -story.avg_score_over_time }
    
    return top_500.first(10)
  end
  

  private
    def get_500_new_stories
      JSON.parse(self.class.get("/newstories.json").body)
    end
  
    def get_story_item item_id
      params = JSON.parse(self.class.get("/item/#{item_id}.json").body)
      
      # initialize new story item
      item = Story.new(params)
    end
  
end