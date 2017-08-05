Rails.application.routes.draw do
  root      'static_pages#home'
  get       'static_pages/home'
  get       'static_pages/help'
  resources :stories
  resources :users
end
