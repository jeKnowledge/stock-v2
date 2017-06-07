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
  get '/items/:id', to: 'items#setup_aquire', as: 'setup_aquire_item'
  get '/items/:id', to: 'items#setup_return', as: 'setup_return_item'
  get '/items/:id', to: 'items#setup_destroy', as: 'setup_delete_item'
  delete '/items/:id', to: 'items#destroy', as: 'delete_item'


  get '/teste', to:'items#index_2'

  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  post '/create_waiting_queue', to: 'waiting_queue#create', as: 'create_waiting_queue'

  delete '/delete_waiting_queue', to: 'waiting_queue#destroy', as: 'delete_waiting_queue'

  resources :users
  resources :items 

end
