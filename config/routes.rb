Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    resources :users, only: [] do
      collection do
        put :update, path: ''
        post :upload_file, path: 'upload/:document_name'
        delete :delete_file, path: 'upload/:document_name'
      end
    end

    resources :employments, only: [] do
      collection do
        get :public_employments, path: 'public'
        get :public_employment, path: 'public/:id'
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
          post :upload_establishment_file, path: 'upload/establishment/:document_name'
          delete :delete_establishment_file, path: 'upload/establishment/:document_name'
        end
      end
      resources :postulations
      collection do
        get :activities, path: ':id/activities'
      end
    end

    resources :applicants
    resources :postulations do
      collection do
        get :activities, path: ':id/activities'
      end
    end
    resources :work_experiences
    resources :academic_trainings
    resources :skills, only: [:index, :create]

    resources :onboarding, only: [:create] do
      collection do
        get :validate_user_email, path: '/validate_user_email'
        get :validate_user_dni, path: '/validate_user_dni'
        get :validate_establishment_dni, path: '/validate_establishment_dni'
      end
    end
  end
end
