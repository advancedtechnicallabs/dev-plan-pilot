json.extract! milestone, :id, :project_id, :estimated_completion_date, :descriptive_name, :status, :created_at, :updated_at
json.url milestone_url(milestone, format: :json)
