class AddUsersIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email
    add_index :users, :name
    add_index :users, :guid
  end
end
