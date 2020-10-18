Rails.application.routes.draw do
  root   'introductions#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'users#login'
  post   '/login',   to: 'users#login'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/api/users/:id/transactions', to: 'users#api_transaction'

  resources :users do
    resources :transactions
  end
end
