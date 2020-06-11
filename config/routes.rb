Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'groups#index'
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update]
end
 