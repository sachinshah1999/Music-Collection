Rails.application.routes.draw do
  devise_for :users
  # declare all of the common routes for songs controller
  resources :songs
  # make index action our root path
  root 'songs#index'
  # Add route to contact form
  get 'contact', to: 'songs#contact'
  # POST route for contact form
  post 'request_contact', to: 'songs#request_contact'
end
