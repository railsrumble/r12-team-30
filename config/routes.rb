Foodstrap::Application.routes.draw do
  themes_for_rails

  devise_for :users

  resources :stores do
    member do
      get :manage_orders
    end
  end

  resources :orders do
    member do
      post :confirm
      post :complete
    end
  end

  root :to => 'landing#home'
end
