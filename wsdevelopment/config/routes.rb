Rails.application.routes.draw do
  get 'logout' => 'session#destroy', :as => 'logout'
  get 'login' => 'session#new', :as => 'login'
  post 'login' => 'session#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :notes do
      get 'share' => 'notes#share', :as => 'share'
      post 'share_with_friend' => 'notes#share_with_friend'
      post 'unshare_with_friend' => 'notes#unshare_with_friend'
    end

    resources :friendships, only: [:index, :create, :update, :destroy]
  end

  root 'welcome#index'
end
