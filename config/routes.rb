Rails.application.routes.draw do
  namespace :api do
    resources :endpoints, param: :signature
  end
end
