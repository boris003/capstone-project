Rails.application.routes.draw do

  get '/' => 'posts#landing'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  get '/users/:id' => 'users#show'
  post 'users/subscribe' => 'users#subscribe'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/posts' => 'posts#index'
  get '/myfeed' => 'posts#myfeed'
  get '/discover' => 'posts#discover'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'
  post '/posts/:id/comment' => 'posts#newcomment'
  post '/posts/:id/vote' => 'posts#vote'

  get '/getout' => 'posts#getout'
  get '/didntitellyou' => 'posts#didntitellyou'
  get '/ohgod' => 'posts#ohgod'

  get '/about' => 'users#about'
  get '/contact' => 'users#contact'


end
