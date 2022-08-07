Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :client

  namespace :api do
    namespace :v1 do
      root "home#home"
    end
  end
end
