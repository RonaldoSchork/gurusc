class HomeController < PostsController

  def index
    @last_meeting = Meeting.last
    @last_post = Post.last
  end

end
