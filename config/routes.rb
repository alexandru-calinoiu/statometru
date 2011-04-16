Statometru::Application.routes.draw do

  root :to => "search#index"
  devise_for :users

  resources :search, :only => [:index, :find]

  match "/search" => "search#index"
  match "/find" => "search#find"

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'

  match 'institutie/:id' => 'institutions#details'
  match 'institutie/:id/noteaza/:nota' => 'institutions#rate'

  resources :search, :only => [:search]
  match "/search" => "search#index"
end
