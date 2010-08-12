module ApplicationHelper

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
end
