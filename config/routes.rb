Rails.application.routes.draw do
  devise_for :users
  # root "articles#index"
   root "home#index"
end
