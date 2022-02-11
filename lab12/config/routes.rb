Rails.application.routes.draw do
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
  root 'index#input'
  get 'index/input'
  get 'index/output'
end
