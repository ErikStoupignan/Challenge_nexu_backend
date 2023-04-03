Rails.application.routes.draw do

  resources :brands, only: %i[index create show] do
    resources :models, only: %i[index create]
  end

  resources :models, only: %i[index update]
end
