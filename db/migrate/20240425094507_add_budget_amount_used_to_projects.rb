class AddBudgetAmountUsedToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :budget_amount_used, :decimal
  end
end
