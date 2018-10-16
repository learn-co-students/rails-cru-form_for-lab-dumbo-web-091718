Rails.application.routes.draw do
  resources :artists, only: [:new, :index, :show, :create, :edit, :update]
  resources :songs, only:[:new, :index, :show, :create, :edit, :update]
  resources :genres, only:[:new, :index, :show, :create, :edit, :update]
end
