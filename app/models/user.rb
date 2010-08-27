class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name

  has_many :posts
  has_many :meetings
  has_and_belongs_to_many :projects

  validates_format_of :full_name, :with => /^([\w\d]+ [\w\d]+)+$/
end
