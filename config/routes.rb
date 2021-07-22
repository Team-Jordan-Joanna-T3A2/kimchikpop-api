Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope "/api" do
    resources :reservations

    
    #   get '/users', to: 'users#index'
      post '/sign-up', to: 'users#sign_up'
      post '/login', to: 'users#login'

    #   get '/users/:id', to: 'users#show'
    #   put '/users/:id', to: 'users#update'
    #   delete '/users/:id', to: 'users#destroy'

    #   get '/reservations', to: 'reservations#index'
    #   post '/reservations', to: 'reservations#create'
    #   get '/reservations/:id', to: 'reservations#show'
    #   put '/reservations/:id', to: 'reservations#update'
    #   delete '/reservations/:id', to: 'reservations#destroy'
  end
end
