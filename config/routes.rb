ServicesDemo::Application.routes.draw do

  devise_for :users

  root :to => "policies#index"
  resources :policies do
    collection do
      post :count
    end
  end
  resources :products do
    get :autocomplete_product_name, :on => :collection
  end
  namespace :admin do
    resources :policies
  end

  get '/autologin' => 'sessions#autologin' if Rails.env.test?

end
