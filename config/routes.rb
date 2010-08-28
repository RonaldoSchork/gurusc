Gurusc::Application.routes.draw do
  
  resources :projects do
    get 'member_add', :on => :member
    get 'member_remove', :on => :member
  end
  
  resources :projects

  resources :meetings

  root :to => "home#index"
  
  scope '/admin' do
    devise_for :users, :controllers => {
      :sessions      => "admin/sessions",
      :passwords     => "admin/passwords"
    }
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

  resources :posts, :only => [:show, :index] do
    resources :comments
  end

end
