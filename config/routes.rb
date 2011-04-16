Statometru::Application.routes.draw do
  root :to => "institutions#index"

  resources :users
  resources :user_sessions

  match 'login' => "user_sessions#new"
  match 'logout' => "user_sessions#destroy"

  match "/search" => "institutions#index"
  match "/find" => "institutions#find"
  match 'institutie/:id' => 'institutions#details'
  match 'institutie/:id/noteaza' => 'institutions#rate'
end
