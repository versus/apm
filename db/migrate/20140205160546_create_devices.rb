class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name, :null => false
      t.string :imei, :null => false
      t.string :device_token, :null => false
      t.references :user, index: true

      t.timestamps
    end
  end
end
