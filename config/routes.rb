Rails.application.routes.draw do
  resources :users, only: %i[index show] do
    resources :posts, only: [:index]
  end

  get '/users/:user_id/posts/:id', to: 'posts#show'
end
