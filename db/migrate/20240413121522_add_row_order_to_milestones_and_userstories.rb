class AddRowOrderToMilestonesAndUserstories < ActiveRecord::Migration[7.0]
  def change
    add_column :milestones, :row_order, :integer
    add_column :user_stories, :row_order, :integer
  end
end
