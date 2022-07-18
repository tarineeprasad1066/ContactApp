Rails.application.routes.draw do
   devise_for :users
   devise_scope :user do  
      get '/users/sign_out' => 'devise/sessions#destroy'
      root :to => 'home#index'     
end
   resources :albums
   resources :users, only: [:show] 
end
