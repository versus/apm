class AddExpireAndRetry < ActiveRecord::Migration
  def change
    add_column    :api_messages, :expire, :integer
    add_column    :api_messages, :retry, :integer
    add_column    :api_messages, :message_hash, :string, :unique => true, :null => false
  end
end
