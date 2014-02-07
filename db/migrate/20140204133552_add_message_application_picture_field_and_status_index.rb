class AddMessageApplicationPictureFieldAndStatusIndex < ActiveRecord::Migration
  def change
    add_column  :api_messages, :app_pic, :string, :default => "default.png", :null => false
    add_index   :api_messages, :status 
  end
end
