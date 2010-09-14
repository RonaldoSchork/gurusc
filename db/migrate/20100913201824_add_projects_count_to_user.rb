class AddProjectsCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :number_of_projects, :integer, :default => 0
  end

  def self.down
    remove_column :users, :number_of_projects
  end
end
