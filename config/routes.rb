Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    devise_scope :user do
            post 'signup', to: '/apiregistrations#create'
            post 'login', to: '/apisessions#create'
            delete 'signout', to: '/apisessions#destroy'
          end
    resources :transactions
  end
    
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, only: []

  # Defines the root path route ("/")
  root "pages#index"
  resources :transactions
end
