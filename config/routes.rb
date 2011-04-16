Statometru::Application.routes.draw do

  root :to => "search#index"

  resources :users
  resources :user_sessions

  match 'login' => "user_sessions#new"
  match 'logout' => "user_sessions#destroy"



  resources :search, :only => [:index, :find]

  match "/search" => "search#index"
  match "/find" => "search#find"

  match 'institutie/:id' => 'institutions#details'
  match 'institutie/:id/noteaza' => 'institutions#rate'

  resources :search, :only => [:search]
  match "/search" => "search#index"
end
