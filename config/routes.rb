Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  namespace :api do
    namespace :v1 do
      root "home#home"
    end
  end
end
