Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    collection do
      get :draft
    end
    member do
      put "publish", to: "posts#publish"
      put "like", to: "posts#like"
      put "dislike", to: "posts#dislike"
    end
    resources :comments do
      member do
        put "like", to: "comments#like"
        put "dislike", to: "comments#dislike"
      end
    end
  end
  resources :users do
    get :profile
  end
end
