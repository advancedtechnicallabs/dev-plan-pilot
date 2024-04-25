class AddStartDateToMilestones < ActiveRecord::Migration[7.0]
  def change
    add_column :milestones, :estimated_start_date, :date
  end
end
