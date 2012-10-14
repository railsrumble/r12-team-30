Foodstrap::Application.routes.draw do
  themes_for_rails

  devise_for :users

  resources :stores do
    member do
      get :manage_orders
    end
  end

  root :to => 'landing#home'
end
