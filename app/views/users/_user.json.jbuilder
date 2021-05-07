json.extract! user, :id, :email, :session_token, :created_at, :updated_at
json.url user_url(user, format: :json)
