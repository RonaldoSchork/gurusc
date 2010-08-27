class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name

  has_many :posts
  has_many :meetings

  validates_format_of :full_name, :with => /^([\w\d]+ [\w\d]+)+$/
end
