class Meeting < ActiveRecord::Base
  validates_presence_of :title, :date, :description
  validates_uniqueness_of :title, :allow_blank => true
end
