Rails.application.routes.draw do
  devise_for :users
  # declare all of the common routes for songs controller
  resources :songs
  # make index action our root path
  root 'songs#index'
end
