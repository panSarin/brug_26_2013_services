ServicesDemo::Application.routes.draw do

  devise_for :users

  root :to => "policies#index"
  resources :policies do
    collection do
      post :count
    end
  end

  namespace :admin do
    resources :policies
  end

end
