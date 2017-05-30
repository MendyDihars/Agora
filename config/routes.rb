Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users, controllers: { registrations: "users/registrations" }
  # devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:index, :show] do
    resources :meetings, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :meetings, only: [:index, :show]
  post '/students/:id/notification', to: 'students#notification', as: 'notification_student'
  patch '/meeting/:id/status', to: "meetings#change_status", as: "status_meeting"
  patch '/meeting/:id/validation', to: "meetings#validate", as: "validation_meeting"

  resources :students, only: [:index]
end
