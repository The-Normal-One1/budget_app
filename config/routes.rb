Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root to: "home#index"

  # Defines the root path route ("/")
  root to: "pages#splash"

  # Define routes for the users
  authenticate :user do
      root to:'groups#index', as: :authenticated_root
  end

  resources :groups do
    resources :specifications
  end
  # Define routes for the home page
  # root "home#index"

end
