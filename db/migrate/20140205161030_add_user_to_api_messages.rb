class AddUserToApiMessages < ActiveRecord::Migration
  def change
    add_reference :api_messages, :user, index: true
  end
end
