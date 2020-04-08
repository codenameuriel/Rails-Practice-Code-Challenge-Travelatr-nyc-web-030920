Rails.application.routes.draw do
  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'

  resources :bloggers, only: [:show, :new, :create]
  resources :posts, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
