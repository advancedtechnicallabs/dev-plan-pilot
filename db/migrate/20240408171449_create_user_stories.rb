class CreateUserStories < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stories do |t|
      t.integer :milestone_id
      t.text :descriptive_name
      t.integer :membership_id
      t.integer :project_id
      t.date :estimated_completion_date

      t.timestamps
    end
  end
end
