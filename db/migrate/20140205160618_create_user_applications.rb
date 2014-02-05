class CreateUserApplications < ActiveRecord::Migration
  def change
    create_table :user_applications do |t|
      t.string :name
      t.text :description
      t.string :application_token
      t.references :user, index: true

      t.timestamps
    end
  end
end
