Rails.application.routes.draw do

  resources :refeicaos
  devise_for :users

  get 'refeicoes', to: "refeicaos#index"
  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
