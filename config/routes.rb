Rails3BootstrapDeviseCancan::Application.routes.draw do
  resources :comments
  resources :posts

  match '/links' => 'posts#links'
  match '/requests' => 'posts#requests'
  match '/forums' => 'posts#forums'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end