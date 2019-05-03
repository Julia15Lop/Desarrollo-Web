Rails.application.routes.draw do
  get 'logout' => 'session#destroy', :as => 'logout'
  get 'login' => 'session#new', :as => 'login'
  post 'login' => 'session#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :notes
    resources :friendships, only: [:index, :create, :update, :destroy]
  end

  root 'welcome#index'
end
