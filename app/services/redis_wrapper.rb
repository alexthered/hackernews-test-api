require 'rubygems'
require 'redis'

class RedisWrapper
  
  LIST_STORY = 'list_stories'
  MAX_STORY_LIST_SIZE = 500
  
  TOP_STORY = 'top_story'
  
  def push_stories(story_list)
    story_list.each do |story|
      Redis.current.lpush(LIST_STORY, story.to_json)
    end
    
    # trim the list so only the first MAX_STORY_LIST_SIZE stories are retained
    Redis.current.ltrim(LIST_STORY, 0, MAX_STORY_LIST_SIZE-1)
  end
  
  def get_last_10_stories
    @stories = []
    stories_json = Redis.current.lrange(LIST_STORY, MAX_STORY_LIST_SIZE - 10, -1)
    stories_json.each do |story_json|
      @stories << Story.new(JSON.parse(story_json))
    end
    
    # reverse the array so that the story with highest avg_score_over_time stays first
    return @stories.reverse!
  end
  
  def get_lifetime_top_story
    story_json = JSON.parse(Redis.current.get(TOP_STORY))

    Story.new(story_json)
  end
  
  def set_lifetime_top_story(new_top_story)
    Redis.current.set(TOP_STORY, new_top_story.to_json)
  end
end