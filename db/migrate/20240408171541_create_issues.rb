class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.text :description
      t.integer :task_id
      t.string :status
      t.text :resolution_explanation

      t.timestamps
    end
  end
end
