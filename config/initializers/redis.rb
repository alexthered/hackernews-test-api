module ReadCache
  class << self
    def redis
      Redis.current ||= Redis.new(:url => (ENV["REDIS_URL"] || 'redis://127.0.0.1:6379'))
    end
  end
end