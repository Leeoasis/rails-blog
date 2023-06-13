Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'posts/index'
  get 'posts/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
