Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome/home', to: 'welcome#home'
  get 'welcome/about', to: 'welcome#about'
  resources :articles

  get 'welcome/signup', to: 'users#new'
  resources :users, except: [:new]

  get 'welcome/login', to: 'sessions#new'
  post 'welcome/login', to: 'sessions#create'
  delete 'welcome/logout', to: 'sessions#destroy'

end
=begin
  resources :users, except: [:new]
  resources :articles
  resources :categories, except: [:destroy]

  root 'welcome#home'

  get 'home',  to: 'welcome#home'
  get 'about', to: 'welcome#about'

  get 'signup',     to: 'users#new'
  get 'login',      to: 'sessions#new'
  post 'login',     to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
=end

  
