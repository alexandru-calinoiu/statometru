Statometru::Application.routes.draw do
  get "directories/show"

  root :to => "directories#index"

  resources :users
  resources :user_sessions

  match 'login' => "user_sessions#new"
  match 'logout' => "user_sessions#destroy"

  resource :directories

  match "/search" => "directories#index"
  match "/find" => "institutions#find"
  match 'institutie/:id' => 'institutions#details'
  match 'institutie/:id/noteaza' => 'institutions#rate'
  match 'categorie/:id' => 'directories#show'
end
