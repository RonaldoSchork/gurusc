Gurusc::Application.routes.draw do

  root :to => "home#index"

  namespace :admin do
    resources :posts
    resources :post_categories, :except => [:show]
    resources :uploads
  end

  resources :posts, :only => [:show, :index] do
    resources :comments
  end
end
