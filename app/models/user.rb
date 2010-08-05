class User < ActiveRecord::Base
  
  has_many :posts

  validates_presence_of :full_name, :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  
end
