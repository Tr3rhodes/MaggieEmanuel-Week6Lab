class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column  :users, :username, :string
    add_column  :users, :user_photo, :string
    add_column  :users, :user_bio,  :string
  end
end
