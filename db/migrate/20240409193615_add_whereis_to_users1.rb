class AddWhereisToUsers1 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :whereis, :string, default: "project_list"
  end
end
