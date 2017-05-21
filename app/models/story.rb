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
  TIME_PERIOD_IN_SECOND = 1800 #0.5h
  
  attr_accessor :id, :score, :time, :title, :url, :elapsed_time, :avg_score_over_time

  def initialize(params)
    
    @id = params["id"]
    @score = params["score"]
    @time = Time.at(params["time"])
    @title = params["title"]
    @url = params["url"]
    @elapsed_time = ((Time.now - @time)/TIME_PERIOD_IN_SECOND).round(2)
    @avg_score_over_time = (@score / @elapsed_time).round(2)
    
  end
  
end