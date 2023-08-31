Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    resources :users, only: [] do
      collection do
        put :update, path: ''
      end
    end

    resources :establishments do
      resources :employments do
        collection do
          get :applicants, path: ':id/applicants'
          post :find_or_create_postulation, path: ':id/find_or_create'
          get :resume, path: 'get/resume'
        end
      end
      resources :tests do
        resources :questions do
          resources :alternatives
        end
      end
      resources :flows do
        resources :stages
      end
      resources :users, only: [] do
        collection do
          put :update_establishment, path: '/update/establishment'
        end
      end
      resources :postulations
    end

    resources :applicants
    resources :postulations

    resources :onboarding, only: [:create] do
      collection do
        get :validate_user_email, path: '/validate_user_email'
        get :validate_user_dni, path: '/validate_user_dni'
        get :validate_establishment_dni, path: '/validate_establishment_dni'
      end
    end
  end
end
