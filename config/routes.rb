Rails.application.routes.draw do
  resources :stories
  resources :users
  root 'application#welcome'
end
