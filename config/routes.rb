Rails.application.routes.draw do
  
    devise_for :users do
      get 'login', to: 'devise/sessions#new'
    end
    devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
    ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users
  root 'users#index'
  post "user_attendance" => "attendances#user_attendance", as: :user_attendance
  get "login_detail/:id" => "users#login_detail", as: :login_detail
end
