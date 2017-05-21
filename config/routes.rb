Rails.application.routes.draw do
  apipie
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: {format: :json} do
    get '/health', to: 'health#index'
    get '/stories', to: 'story#index'
    get '/stories/top', to: 'story#get_lifetime_top_story'
  end
end
