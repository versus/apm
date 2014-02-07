class AddStatusToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :status, :integer, :default => 0, :null => false
  end
end
