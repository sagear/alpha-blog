Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html3
  root'pages#home'
  get '/about', to: 'pages#about'
  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
