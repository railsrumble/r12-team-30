Rumble::Application.routes.draw do
  devise_for :users

  resources :stores

  root :to => 'stores#index'
end
