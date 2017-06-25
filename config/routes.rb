Rails.application.routes.draw do

  get '/' => 'users#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  get 'users/:id/show' => 'users#show'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/post/:id' => 'post#'





end
