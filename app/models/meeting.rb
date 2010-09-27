class Meeting < ActiveRecord::Base
  validates_presence_of   :title, :date, :description, :image
  validates_uniqueness_of :title, :allow_blank => true

  has_attached_file                 :image, :styles => { :medium => "330x248#", :thumb => "116x87#" }
  validates_attachment_size         :image, :less_than => 5.megabyte,
                :message => I18n.t('activerecord.errors.messages.attachment_size', :min => 0, :max => 5.megabyte)
  validates_attachment_content_type :image, :content_type => %w(image/png image/jpeg image/gif image/tiff), 
                :message => I18n.t('activerecord.errors.messages.attachment_type', :types => "png, jpeg, gif ou tiff")
end
