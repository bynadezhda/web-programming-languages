Rails.application.routes.draw do
  root 'index#input'
  get 'index/input'
  get 'index/output'
  get 'cached' => 'index#cached'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
