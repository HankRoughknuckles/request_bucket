Rails.application.routes.draw do
  resources :endpoints, param: :signature
end
