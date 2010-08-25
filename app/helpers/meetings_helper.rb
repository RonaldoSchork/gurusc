module MeetingsHelper
  
  def print_present(resource, msg)
    link_to(msg, resource, :target => '_blank') if resource.present?
  end

end
