Rails.application.routes.draw do

  resources :users do 
    member do 
      get :following, :followers
    end
  end

  get 'messages/:user_id' => 'messages#show', as: :chat
  post 'messages/:user_id' => 'messages#send_message', as: :send_message  

  resources :account_activations, only: [:edit]
  resources :password_reset,      only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy] do
    resources :likes,             only: [:create, :destroy]
    resources :comments,          only: [:create, :destroy]
  end

  resources :relationships,       only: [:create, :destroy]
  
  root 'static_pages#home'
  
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new' 
  get  'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
