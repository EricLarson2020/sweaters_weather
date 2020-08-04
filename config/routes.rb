Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/road_trip', to: 'road_trip#create'
      post '/sessions', to: 'sessions#create'
      get '/backgrounds', to: 'background#index'
      get '/forecast', to: 'forecast#index'
      post '/users', to: 'users#create'
    end
  end
end
