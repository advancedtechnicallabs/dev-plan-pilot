json.extract! user_story, :id, :milestone_id, :descriptive_name, :membership_id, :project_id, :estimated_completion_date, :created_at, :updated_at
json.url user_story_url(user_story, format: :json)
