class AddLocalToMeetings < ActiveRecord::Migration
  def self.up
    add_column :meetings, :local, :string
  end

  def self.down
    remove_column :meetings, :local
  end
end
