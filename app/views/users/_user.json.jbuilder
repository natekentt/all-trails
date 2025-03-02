json.extract! user, :id, :email, :password_digest, :first_name, :last_name, :profile_picture, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
