=begin
  Hackernews's story item

  Sample response for s story:
  {
      "by" : "dhouston",
      "descendants" : 71,
      "id" : 8863,
      "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
      "score" : 111,
      "time" : 1175714200,
      "title" : "My YC app: Dropbox - Throw away your USB drive",
      "type" : "story",
      "url" : "http://www.getdropbox.com/u/2/screencast.html"
  }
=end

class Story
  TIME_UNIT_IN_SECOND = 60 #1 minute
  
  attr_accessor :id, :score, :title, :url, :elapsed_time, :descendants, :avg_score_over_time, :by
  
  def initialize(params)
    
    @id = params["id"]
    @score = params["score"]
    @title = params["title"]
    @url = params["url"]
    @by = params["by"]
    @descendants = params["descendants"]
    @elapsed_time = params["elapsed_time"] || get_elapsed_time(params["time"])
    @avg_score_over_time = params["avg_score_over_time"] || get_avg_score_over_time(@elapsed_time)
    
  end
  
  def get_elapsed_time(created_time)
    ((Time.now() - Time.at(created_time))/TIME_UNIT_IN_SECOND).round(2) unless !created_time.present?
  end
  
  # calculate the avg_score_over_time of each article, multiply by 1000 for better differentiation and ranking
  def get_avg_score_over_time(elapsed_time)
    (elapsed_time == 0) ? 0 : (100 * @score / @elapsed_time)
  end
  
  def pretty_lifetime
    rounded_elapsed_time = self.elapsed_time.round()
    
    if rounded_elapsed_time < 60
      "#{rounded_elapsed_time} minutes"
    else
      "#{rounded_elapsed_time / 60} hours #{rounded_elapsed_time%60} minutes"
    end
  end
  
end