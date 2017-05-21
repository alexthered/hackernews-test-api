class StoryRankingService
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0/'
  
  def get_top_10_stories
    RedisWrapper.new.get_last_10_stories
  end
  
  def get_lifetime_top_story
    RedisWrapper.new.get_lifetime_top_story
  end
  
  def rank_new_500_stories
    newest_500_ids = get_500_new_stories
  
    newest_500 = []
    newest_500_ids.each_with_index do |id, index|
      newest_500 << get_story_item(id)
      Rails.logger.info "DONE fetching item #{index}" if index%50 == 0
    end
  
    #rank the retrieved story by its avg_score_over_time
    newest_500.sort_by!{ |story| -story.avg_score_over_time }
  
    RedisWrapper.new.push_stories(newest_500)
    
    #decide new lifetime top story between existing lifetime top story (if any) and the new one with highest score
    find_new_top_story(newest_500[0])
    
  end
  
  def find_new_top_story(potential_top_story)
    r = RedisWrapper.new
    
    top_story = r.get_lifetime_top_story
    
    if !top_story.present? or potential_top_story.avg_score_over_time > top_story.avg_score_over_time
      r.set_lifetime_top_story(potential_top_story)
    end
    
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