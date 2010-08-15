Gurusc::Application.routes.draw do
  
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
    resources :post_categories, :except => [:show]
    resources :uploads
  end
  
  resources :posts, :only => [:show, :index] do
    resources :comments
  end

end
