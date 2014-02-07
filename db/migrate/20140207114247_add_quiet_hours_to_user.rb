class AddQuietHoursToUser < ActiveRecord::Migration
  def change
    add_column :users, :quiet_from, :string, :default => "0", :null => false
    add_column :users, :quiet_to, :string, :default => "0", :null => false
  end
end
