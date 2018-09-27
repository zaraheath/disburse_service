Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [] do
        resources :disbursements, only: [:index]
      end
    end
  end
end
