Rails.application.routes.draw do
  resources :messages, :except => [:show]
  resources :events
  resources :trip_users
  resources :trips
  resources :users

  post '/login', :to => 'users#login'
  post '/groups', :to => 'trip#groups'
  get '/messages/:trip_id', :to => 'messages#index'
  get '/friends/:trip_id', :to => 'trips#friend'

  get '/find', :to => 'search#find'
  get '/findcord', :to => 'search#findCord'
  get '/findevent', :to => 'search#findEvent'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
