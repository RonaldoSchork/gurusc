class Project < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates_presence_of   :name, :description, :git
  validates_uniqueness_of :git, :allow_blank => true
end
