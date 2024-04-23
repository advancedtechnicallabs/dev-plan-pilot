class AddColumnAvatarLocToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar_loc, :text
  end
end
