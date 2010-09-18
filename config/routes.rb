Gurusc::Application.routes.draw do
  
  root :to => "home#index"

  resources :contacts, :only => [:new, :create]
  match '/contato' => "contacts#new"
 
  resources :projects do
    get 'member_add', :on => :member
    get 'member_remove', :on => :member
  end
  match '/projetos' => "projects#index"
  
  resources :users, :except => [:delete]
  match '/membros' => "users#index"

  resources :meetings, :only => [:index]
  match '/encontros' => "meetings#index"
  
  scope '/admin' do
    devise_for :users, :controllers => {
      :sessions      => "admin/sessions",
      :passwords     => "admin/passwords"
    }
  end
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end


  namespace :admin do
    root :to => "posts#index"
    resources :users, :except => [:show]
    resources :posts
    resources :projects
    resources :post_categories, :except => [:show]
    resources :uploads
    resources :meetings, :except => [:show]
  end


  match '/blog' => "posts#index"
  resources :posts, :only => [:show, :index] do
    resources :comments
  end

end
