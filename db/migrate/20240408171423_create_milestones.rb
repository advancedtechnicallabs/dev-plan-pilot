class CreateMilestones < ActiveRecord::Migration[7.0]
  def change
    create_table :milestones do |t|
      t.integer :project_id
      t.date :estimated_completion_date
      t.text :descriptive_name
      t.text :status

      t.timestamps
    end
  end
end
