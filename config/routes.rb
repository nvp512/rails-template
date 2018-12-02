Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  #both login and register, if emails and password ok -> callback here
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  get '/auth/failure' => 'sessions#failure', :as => :failure
  get '/signin' => 'sessions#new', :as => :signin #signin
  get '/signup' => 'identities#index', :as => :signup #signup
  get '/signout' => 'sessions#destroy', :as => :signout

  get '/send_email' => 'welcome#send_email', :as => :send_email

  resource :identity, only: [:edit, :update]
  # resource :activations, only: [:new, :update]

  scope :constraints => { id: /[a-zA-Z0-9]{32}/ } do
    # resources :reset_passwords, except: [:edit, :show]
    resources :activations, only: [:edit]
  end

  scope module: :private do
    resources :mypages, only: [:index]
  end

end
