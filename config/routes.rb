Statometru::Application.routes.draw do

  root :to => "search#index"
  devise_for :users

  match 'institutie/:id' => 'institutions#details'
  match 'institutie/:id/noteaza/:nota' => 'institutions#rate'

# viitorul root
#  get "pages/index"

  resources :search, :only => [:search]
  match "/search" => "search#index"
  
end
