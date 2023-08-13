Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do

    resources :establishments
    resources :employments
    resources :applicants
    resources :flows do
      resources :stages
    end
    resources :tests do
      resources :questions do
        resources :alternatives
      end
    end
  end


end
