class Meeting < ActiveRecord::Base
  validates_presence_of :title, :date, :description
  validates_uniqueness_of :title, :allow_blank => true
  
  has_attached_file                 :image, :styles => { :medium => "330x248#", :thumb => "116x87#" }
  validates_attachment_size         :image, :less_than => 5.megabyte
  validates_attachment_content_type :image, :content_type => %w(image/png image/jpeg image/gif image/tiff)
end
