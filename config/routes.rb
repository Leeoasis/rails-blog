Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:show] do
    resources :posts, only: %i[index show], param: :author_id
  end
  resources :posts, only: %i[index show], param: :post_id
end
