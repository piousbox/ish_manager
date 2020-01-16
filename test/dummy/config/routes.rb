Rails.application.routes.draw do
  devise_for :super_users
  # devise_for :users
  root :to => 'application#home'

  mount IshManager::Engine => "/ish_manager"

  # devise_for :users, :skip => [ :registrations ]
  
end
