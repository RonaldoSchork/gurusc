class Project < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "projects_users"

  validates_presence_of :name, :description, :git
  validates_uniqueness_of :git

end
