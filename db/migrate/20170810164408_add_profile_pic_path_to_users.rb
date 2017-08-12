class AddProfilePicPathToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_pic_path, :string
  end
end
