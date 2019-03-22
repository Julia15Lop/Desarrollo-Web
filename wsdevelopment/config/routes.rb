Rails.application.routes.draw do
  get 'notes/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :notes

  root to: "photos#index"
  resources :photos
  root 'notes#index'
end
