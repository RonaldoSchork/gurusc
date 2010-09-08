module ApplicationHelper

  def application_title
    'Guru SC'
  end

  def error_messages_for(resource)
     render "shared/error_messages", :resource => resource
  end

  def flash_messages
    flash.collect do |key, msg|
      content_tag(:p, msg, :id => key, :class => "flash_message")
    end.join.html_safe
  end

  def textilize(text)
    RedCloth.new(text).to_html.html_safe
  end
  
  def gravatar_image_tag(email, html_options = {})
    email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email}?size=48", html_options
  end

  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(:class => "green")
    link_to "Editar", url, html_options
  end

  def link_to_new(url, html_options = {})
    link_to "Novo", url, html_options
  end

  def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(:confirm => 'Você tem certeza?', :method => :delete, :class => "red")
    link_to "Apagar", url, html_options
  end 

end
