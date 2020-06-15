Rails.application.routes.draw do
  resources :groups, only: [:show, :edit, :new, :create, :update, :destroy] do
    member do
      get 'owner'
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'recipes#index'
  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    member do
      get 'mypage'
    end
  end
end
