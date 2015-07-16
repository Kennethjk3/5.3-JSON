Rails.application.routes.draw do
  root 'athletes#index'
  resources :athletes, only[:index, :show, :create, :update, :destroy]
end
