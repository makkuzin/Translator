Rails.application.routes.draw do
  root 'main#index'

  resource :languages, only: :create
end
