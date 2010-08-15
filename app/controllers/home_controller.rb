class HomeController < ApplicationController
  def index
    @last_post = Post.last
  end

end
