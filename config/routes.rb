Rails.application.routes.draw do
  devise_for :admins
  resources :donations
  devise_for :users
  resources :campaigns
  resources :donations
  root to:"campaigns#index"
end
