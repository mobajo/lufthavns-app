Rails.application.routes.draw do
  get 'arrivals/index'
  get 'arrivals/show'
  get 'departures/index'
  get 'departures/show'

  namespace :api do  
    namespace :v1 do
      resources :departures
      resources :arrivals
    end
  end

  root to: 'departures#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
