Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new' 
  post '/signup',  to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/new_item', to: 'items#new'
  put 'items/:id', to: 'items#update', as: 'items_update'
  
  get '/your_items', to: 'items#your_items'
  get '/items_not_available', to: 'items#items_not_available'
  get '/items_available', to: 'items#items_available'
  delete '/items/:id', to: 'items#destroy', as: 'delete_item'

  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  resources :users
  resources :items 



end
