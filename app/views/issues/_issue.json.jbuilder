json.extract! issue, :id, :description, :task_id, :status, :resolution_explanation, :created_at, :updated_at
json.url issue_url(issue, format: :json)
