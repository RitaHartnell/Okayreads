Rails.application.routes.draw do
  
  resources :reviews, only: [:show, :create, :new, :edit, :update, :delete]
  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show, :create, :new]
  resources :users, only: [:show, :new, :create, :edit, :update]
  root to: 'books#index'
  get '/search' => 'books#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
