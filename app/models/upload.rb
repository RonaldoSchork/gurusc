class Upload < ActiveRecord::Base
  validates_presence_of :title

  has_attached_file :document, :styles => { :medium => "500x375#", :thumb => "70x52#" }

  validates_attachment_presence     :document
  validates_attachment_size         :document, :less_than => 5.megabyte
  validates_attachment_content_type :document, :content_type => %w(image/png image/jpeg image/gif image/tiff)
end
