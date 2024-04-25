class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.decimal :budget_amount
      t.text :project_description
      t.date :estimated_completion_date
      t.string :status
      t.text :skillset_requirements

      t.timestamps
    end
  end
end
