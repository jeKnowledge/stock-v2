Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new' 
  post '/signup',  to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/new_item', to: 'items#new'
  put 'items/:id', to: 'items#update', as: 'items_update'
  
  delete '/items/:id', to: 'items#destroy', as: 'delete_item'

  resources :users
  resources :items 



end
