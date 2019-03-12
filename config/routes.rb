Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resource :dashboard, only: [:show]

  resources :elections do
    resources :eligible_voters, only: [:index, :create]
    resources :candidatures, only: [:index, :new, :create]
  end

  resources :candidatures, only: [] do
    resources :votes, only: [:create]
  end

  resources :eligible_voters, only: [:destroy]
  resources :candidatures, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
