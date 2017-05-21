class V1::HealthController < ApplicationController

  api :GET, "/health", "Check the app's health"
  description "Endpoint to do health check for the application, it should always return OK 200 status"
  def index
    render json: {status: "Alles is gut"}, status: 200
  end

end
