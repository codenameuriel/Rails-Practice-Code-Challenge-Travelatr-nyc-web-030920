Rails.application.routes.draw do
  resources :bloggers, only: [:show, :new, :create]
  # resources :posts, except: [:destroy]
  resources :posts, except: [:destroy] do 
    patch :likes, on: :member
  end 
  resources :destinations

  get '/search', to: 'destinations#search'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
