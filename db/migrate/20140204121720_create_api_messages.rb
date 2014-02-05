class CreateApiMessages < ActiveRecord::Migration
  def change
    create_table :api_messages do |t|
      t.string  :title
      t.text    :message
      t.integer :sound, :default => "default.png", :null => false
      t.integer :priority, :default => "0", :null => false
      t.string  :url
      t.string  :url_title
      t.integer :status, :default => "0", :null => false
      t.text    :errors
      t.timestamps
    end
  end
end
