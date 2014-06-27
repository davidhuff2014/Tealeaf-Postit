# encoding: UTF-8

# routes and resources
PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # add paths manually  becuase this is not an object
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # get '/posts', to: 'posts#index'
  # get '/posts/:id', to: 'posts#show'
  # get '/posts/new', to: 'posts#new'
  # post '/posts', to: 'post#edit'
  # get '/posts/:id/edit', to: 'posts#edit'
  # patch '/posts/:id', to: 'posts#update'

  resources :posts, except: [:destroy] do
    member do
      post :vote
    end
    resources :comments, only: [:create] do
      member do
        post :vote
      end
    end
  end

  resources :categories, only: [:create, :new, :show]
  resources :users, only: [:create, :show, :edit, :update]
end


