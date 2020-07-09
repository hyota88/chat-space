Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'groups#index'
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do 
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
 