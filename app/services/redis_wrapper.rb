require 'rubygems'
require 'redis'

class RedisWrapper
  
  LIST_STORY = "list_stories"
  MAX_STORY_LIST_SIZE = 500
  
  def push_stories story_list
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
    
    return @stories.reverse!
  end
  
end