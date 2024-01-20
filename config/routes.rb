Rails.application.routes.draw do
  resources :posts
  get '/pages', to: 'pages#index'
  #get request for the /pages path should go to the pages controller's index method
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
