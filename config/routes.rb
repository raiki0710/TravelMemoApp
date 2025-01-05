Rails.application.routes.draw do
  root :to => 'homes#top'
  get 'login', to:'sessions#new', as: 'new_sessions'
  post 'login', to:'sessions#create', as: 'create_sessions'
  delete 'logout', to:'sessions#destroy', as: 'logout'
  resources :memos, only: [:index, :create, :update, :destroy]
  resource :users, only: [:new, :edit, :show, :create, :update]
  
#   get 'users/:id/edit', to: 'users#edit', as: 'edit_users' 
  get 'search', to: 'memos#search', as: 'search'
  get 'memospage', to: 'memos#memospage', as: 'memospage'

#   post 'ajax_memos_create', to: 'memos#ajax_create', as: 'ajax_memos_create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '/up', to: 'health#up'


  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
