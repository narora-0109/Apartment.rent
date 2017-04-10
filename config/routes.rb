Rails.application.routes.draw do
  root :to => 'sessions#show'

  get '/listings/show', to: 'listings#show'

  #post '/listings/show', to: 'listings#show'

  get 'listings/create'

  get 'listings/delete'

  get '/users/show', to: 'users#show'

  get 'users/index', to: 'users#index'
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :users

  get 'posts/create'

  get 'posts/update'

  get 'posts/delete'

  post 'sessions/create'

  get 'sessions/destroy'

  #get 'users/new'

  get 'users/login'

  #post 'users', :to => 'users#create'

  #get 'users', :to => 'users#create'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
