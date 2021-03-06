Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  resources :cuisines
  resources :resturants do
    collection do
      post 'distance_calc'
    end
  	resources :reviews
  end
  root 'resturants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
