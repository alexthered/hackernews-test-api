require 'rails_helper'

RSpec.describe Story, type: :model do
  
  before :each do
    @params = { 'id' => 14384187, 'score' => 780, 'time' => 1175714200, 'title' => 'Awesome article', 'url' => 'https://news.ycombinator.com/' }
    @story = Story.new(@params)
  end

  describe "#new" do
    it "takes a hash object and return a story object" do
      expect(@story).to be_an_instance_of Story
    end
  end

  describe "#id" do
    it "returns the correct id" do
      expect(@story.id).to eql @params["id"]
    end
  end
  
  describe "#score" do
    it "returns the correct score" do
      expect(@story.score).to eql @params["score"]
    end
  end
  
  describe "#title" do
    it "returns the correct title" do
      expect(@story.title).to eql @params["title"]
    end
  end

  describe "#url" do
    it "returns the correct title" do
      expect(@story.url).to eql @params["url"]
    end
  end
  
  describe "#time" do
    it "object time should be an instance of Time" do
      expect(@story.time).to be_an_instance_of Time
    end
  end
  
  describe "#elapsed_time" do
    it "elapsed time should not be nil" do
      expect(@story.elapsed_time).not_to be_nil
    end
  end

  describe "#avg_score_over_time" do
    it "Average score over time should not be nil" do
      expect(@story.avg_score_over_time).not_to be_nil
    end
  end
end
