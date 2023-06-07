Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do

    resources :establishments, only: [:update, :create, :destroy, :index, :show]
    resources :employments, only: [:update, :create, :destroy, :index, :show]
    resources :applicants, only: [:update, :create, :destroy, :index, :show]

  end


end
