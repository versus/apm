class CreateUserApplications < ActiveRecord::Migration
  def change
    create_table :user_applications do |t|
      t.string :name, :null => false
      t.text :description
      t.string :application_token, :null => false
      t.references :user, index: true

      t.timestamps
    end
  end
end
