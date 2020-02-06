Rails.application.routes.draw do

  devise_for :users
  resources :todo_lists

  root 'todo_lists#index'
end
