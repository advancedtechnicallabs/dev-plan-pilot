class AddPricePerHourToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :price_per_hour, :decimal
  end
end
