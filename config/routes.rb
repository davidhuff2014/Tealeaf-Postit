# encoding: UTF-8

# routes and resources
PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # get '/posts', to: 'posts#index'
  # get '/posts/:id', to: 'posts#show'
  # get '/posts/new', to: 'posts#new'
  # post '/posts', to: 'post#edit'
  # get '/posts/:id/edit', to: 'posts#edit'
  # patch '/posts/:id', to: 'posts#update'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end

  resources :categories, only: [:create, :new, :show]
end
