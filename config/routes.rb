Rails.application.routes.draw do
  devise_for :users


  root "groups#index"
  resources :users do
      resources :groups  do
        resources :members 
      end
  end

  resources :users do
    resources :groups do
        resources :posts do
          resources :comments
        end
    end
  end
end