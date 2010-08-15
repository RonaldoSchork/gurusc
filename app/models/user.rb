class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :posts

  validates_presence_of :full_name, :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
=======

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name
  
  has_many :posts

  validates_format_of :full_name, :with => /^([\w\d]+ [\w\d]+)+$/

  def first_name
    self.full_name.split.first
  end

  def last_name
    self.full_name.split.last
  end
  
>>>>>>> work
end
