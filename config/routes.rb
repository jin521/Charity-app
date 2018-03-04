Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :donations
  resources :campaigns
  resources :donations
  root to:"campaigns#index"
end
