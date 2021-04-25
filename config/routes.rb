Rails.application.routes.draw do
    
    root to: 'toppages#index'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    resources :rule
    resources :policy
    get 'signup', to: 'users#new'
    resources :users, only: [:index, :show, :new, :create, :edit, :update] do
        member do
            get :followings
            get :followers
        end
        collection do
            get :search
        end
    end
    
    resources :relationships, only: [:create, :destroy]
    resources :tochis, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
        resources :comments, only: [:create, :destroy]
    end

    
    
end
