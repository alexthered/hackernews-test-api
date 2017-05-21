require 'rails_helper'

RSpec.describe V1::HealthController, type: :controller do
  describe "GET index" do
    it 'get current health of the app' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
