Statometru::Application.routes.draw do

  get "pages/index"

  root :to => "pages#index"
  devise_for :users
  
  resources :search, :only => [:search]
  match "/search" => "search#index"
  
end
