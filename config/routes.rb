Rails.application.routes.draw do
  resources :activities, only: [:index, :show, :destroy]
  resources :campers, only: [:index, :show]
end
