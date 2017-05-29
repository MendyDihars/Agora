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

  patch '/meeting/:id/status', to: "meetings#change_status", as: "status_meeting"

  resources :students, only: [:index]
end
