Rails.application.routes.draw do
  devise_for :users

  root "groups#index"

  resources :users do
    resources :groups, only: %i[index show new create destroy] do
      resources :posts, only: %i[create destroy] do
        resources :comments, only: %i[create destroy]
      end
    end
  end
end