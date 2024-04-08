json.extract! project, :id, :project_name, :budget_amount, :project_description, :estimated_completion_date, :status, :skillset_requirements, :created_at, :updated_at
json.url project_url(project, format: :json)
