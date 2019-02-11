Rails.application.routes.draw do
  root 'main#index'

  resources :languages, only: :create
  resources :words, only: :create do
    collection do
      get :search
    end
  end
end
