Rails.application.routes.draw do
  resources :users
  get "/forgot_password", to: "users#forgot_password"
  get "/reset_password", to: "users#reset_password"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
