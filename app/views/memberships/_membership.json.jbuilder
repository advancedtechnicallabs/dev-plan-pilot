json.extract! membership, :id, :project_id, :user_id, :role, :created_at, :updated_at
json.url membership_url(membership, format: :json)
