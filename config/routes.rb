Rails3BootstrapDeviseCancan::Application.routes.draw do
  
  root :to => "home#index"
  devise_for :users
  resources :users

  authenticated :user do
    root :to => 'home#index'
    
    
    resources :comments
	  resources :posts

    resources :links
    resources :requests
    resources :forums



	  match 'faq' => 'home#faq'
	  match 'rules' => 'home#rules'
	  match 'blog' => 'home#blog'
    match 'userlist' => 'home#userlist'
    match 'invites' => 'home#invites'
    match '404' => 'home#error404'

    # match "*path" => redirect("/404")
  end
  

  # match "*path" => redirect("/")
end