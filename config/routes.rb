Rails3BootstrapDeviseCancan::Application.routes.draw do
  

  authenticated :user do
    root :to => 'home#index'
    
    
    resources :comments
	  resources :posts

	  match '/faq' => 'home#faq'
	  match '/rules' => 'home#rules'
	  match '/blog' => 'home#blog'

	  match '/links' => 'posts#links'
	  match '/requests' => 'posts#requests'
	  match '/forums' => 'posts#forums'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :users

  # match "*path" => redirect("/")
end