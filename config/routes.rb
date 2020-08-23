Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :listings, only: %i[index create new update] do
    resources :offers, only: %i[create]
  end
end
