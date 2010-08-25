class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings, :force => true do |t|
      t.string :title
      t.date :date
      t.string :autor
      t.text :description
      t.string :code
      t.string :video
      t.string :slide

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
