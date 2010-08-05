class HomeController < ApplicationController
  def index
    @last_posts = Post.all
  end

end
