Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:index, :show] do
    resources :meetings, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :meetings, only: [:index]

  patch '/meeting/:id/approved', to: "meetings#approved", as: "approved_meeting"
  patch '/meeting/:id/rejected', to: "meetings#rejected", as: "rejected_meeting"

  resources :students, only: [:index]
end
