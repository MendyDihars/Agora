Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:index, :show] do
    resources :meetings, only: [:create]
  end
  resources :meetings, only: [:index]
  resources :students, only: [:index]
end
