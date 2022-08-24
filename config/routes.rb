Rails.application.routes.draw do
  get 'pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  namespace :api do
    namespace :v1 do
      # resources :sessions, 
      resources :registrations, only: [:create]
      delete :logout, to: "users#logout"
      get :logged_in, to: "users#logged_in"
      resources :users, only: [:create], params: :id
      resources :mentors
      resources :reservations, params: :id
    end
  end

  get "*path", to: "pages#index", via: :all
end
