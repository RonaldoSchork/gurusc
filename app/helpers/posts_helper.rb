module PostsHelper

  def gravatar_image_tag(email, html_options = {})
    email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email}?size=48", html_options
  end

  def comment_author(name, url="")
    name = "Anonymous Coward" unless name.present?
    url.present? ? link_to(name, url, :target => "_blank") : name
  end

  def p_category(id)
    PostCategory.find(id).name
  end

  def if_comments?(post)
    if post.comments.count == 1
      "#{post.comments.count} comentário"
    elsif post.comments.count == 0
      "Seja o primeiro a comentar"
    else
      "#{post.comments.count} comentários"
    end
  end


end
