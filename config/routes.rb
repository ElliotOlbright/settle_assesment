Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/ping', to: 'ping#index'
  namespace :api do
    resources :posts, only: [:index]
  end
end
