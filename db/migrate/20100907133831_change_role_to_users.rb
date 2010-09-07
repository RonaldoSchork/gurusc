class ChangeRoleToUsers < ActiveRecord::Migration
  change_table :users do |t|
    t.remove :role
    t.string :role, :default => "member"
  end
end
