Rails.application.routes.draw do
    root to: 'toppages#index'
    resources :rule
    resources :policy
  
end
