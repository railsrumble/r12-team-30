Foodstrap::Application.routes.draw do
  themes_for_rails

  devise_for :users

  resources :stores

  root :to => 'landing#home'
end
