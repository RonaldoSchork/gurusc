<<<<<<< HEAD
class HomeController < ApplicationController
  def index
    @last_posts = Post.all
  end
=======
class HomeController < PostsController
>>>>>>> work
end
