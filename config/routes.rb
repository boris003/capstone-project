Rails.application.routes.draw do

  get '/' => 'posts#myfeed'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  get 'users/:id' => 'users#show'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/myfeed' => 'posts#myfeed'
  get '/discover' => 'posts#discover'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  get '/getout' => 'posts#getout'
  get '/didntitellyou' => 'posts#didntitellyou'
  get 'ohgod' => 'posts#ohgod'

  





end
