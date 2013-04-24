Rails3BootstrapDeviseCancan::Application.routes.draw do
  
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :users

  authenticated :user do
    root :to => 'home#index'
    
    
    resources :comments
	  resources :posts

	  match '/faq' => 'home#faq'
	  match '/rules' => 'home#rules'
	  match '/blog' => 'home#blog'
    match '/404' => 'home#error404'

	  match '/links' => 'posts#links'
	  match '/requests' => 'posts#requests'
	  match '/forums' => 'posts#forums'

    match "*path" => redirect("/404")
  end
  

  match "*path" => redirect("/")
end