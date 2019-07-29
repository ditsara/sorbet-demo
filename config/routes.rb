# typed: strict
Rails.application.routes.draw do
  resources :transactions
  resources :line_items
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
