Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "/api" do
    get "/users", to: "users#index"
    post "/sign-up", to: "users#create"
    get "/users/:id", to: "users#show"
    put "/users/:id", to: "users#update"
    delete "/users/:id", to: "users#destroy"
    post "users/login", to: "users#"

    get "/reservations", to: "reservations#index"
    post "/reservations", to: "reservations#create"
    get "/reservations/:id", to: "reservations#show"
    put "/reservations/:id", to: "reservations#update"
    delete "/reservations/:id", to: "reserations#destroy"
  end
end

# Test comment
