class ChangeColumnToMeetings < ActiveRecord::Migration
  def self.up
    remove_column :meetings, :date
    add_column :meetings, :date, :datetime
  end

  def self.down
    remove_column :meetings, :date
  end
end
