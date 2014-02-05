class ChangeApiMessageErrorField < ActiveRecord::Migration
  def change
    remove_column :api_messages, :errors, :text
    add_column    :api_messages, :message_errors, :text
  end
end
