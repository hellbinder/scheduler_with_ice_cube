Rails.application.routes.draw do
  resources :accounts do
    resources :recurring_payments, only: [:new, :create, :index]
  end
  resources :payments, only: [:index, :show]
  resources :recurring_payments, only: :destroy
  
  root  to: 'accounts#index'
  
end
