Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api do
    namespace :v1 do
      resources :services, except: [:new, :edit, :update]
      resources :reservations, except: [:new, :edit, :update]
    end
  end

  get '/member_details' => 'members#index'

  get "up" => "rails/health#show", as: :rails_health_check

end
