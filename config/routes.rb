Rails.application.routes.draw do
  resources :cuisines
  resources :resturants
  root 'resturants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
