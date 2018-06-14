Rails.application.routes.draw do

  resources :publications
  
  match 'users/:id/toggle' => 'users#toggle_role', :via => :put, :as => :toggle_role
  match 'users/:id/delete' => 'users#delete_user', :via => :delete, :as => :delete_user

  devise_for :users

  get 'users/index', to: 'users#index'
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
