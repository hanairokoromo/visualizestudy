Rails.application.routes.draw do
  
  root to: "public/homes#top"
  
  devise_for :users, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  scope module: :public do
    get 'homes/top'
    resources :users, only: [:show, :edit, :update, :unsubscribe, :withdraw] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end
    resources :categories, only: [:index, :create, :edit, :update]
  end
  
  
  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:show]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
