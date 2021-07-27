Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "/api" do
    get "/users", to: "users#index"
    post "/users/addstaff", to: "users#create"
    get "/users/:id", to: "users#show"
    put "/users/:id", to: "users#update"
    delete "/users/:id", to: "users#destroy"
    post "/users/login", to: "users#login"

    resources :reservations do
      collection do
        get :today 
      end
    end
  end
end
