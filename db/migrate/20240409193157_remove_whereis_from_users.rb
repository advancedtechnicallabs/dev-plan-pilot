class RemoveWhereisFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :whereis, :string
  end
end
