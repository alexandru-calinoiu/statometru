Statometru::Application.routes.draw do
  root :to => "institutions#index"

  devise_for :users

  match "/search" => "institutions#index"
  match "/find" => "institutions#find"
  match 'institutie/:id' => 'institutions#details'
  match 'institutie/:id/noteaza/:nota' => 'institutions#rate'
end
