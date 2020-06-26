Rails.application.routes.draw do
  resources :groups, only: [:show, :edit, :new, :create, :update, :destroy] do
    post :add_user, action: :add_user_group, on: :new
    member do
      get 'owner'
      get 'mygroup'
      post 'remove_user'
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
