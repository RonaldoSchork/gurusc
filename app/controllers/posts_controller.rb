class PostsController < ApplicationController
  def index
    @posts = Post.all
    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end
  
protected
  def categories
    @categories = PostCategory.all
  end
  
end
