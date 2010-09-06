module MeetingsHelper
  
  def print_present(resource, msg)
    link_to(msg, resource, :target => '_blank') if resource.present?
  end
  
  def image?(meeting)
    if meeting.image_file_name?
      image_tag meeting.image.url(:medium)
    end
  end

end
