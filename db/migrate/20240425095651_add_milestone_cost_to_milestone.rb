class AddMilestoneCostToMilestone < ActiveRecord::Migration[7.0]
  def change
    add_column :milestones, :milestone_cost, :decimal
  end
end
