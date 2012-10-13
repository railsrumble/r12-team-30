Foodstrap::Application.routes.draw do
  devise_for :users

  resources :stores

  root :to => 'landing#home'
end
