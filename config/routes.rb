Rails.application.routes.draw do
  resources :tasks, except: [:show, :index]

  resources :projects do
    member do
      get 'tasks_feed'
    end
  end

  devise_for :users

  get 'welcome/index'

  root 'welcome#index'
end
