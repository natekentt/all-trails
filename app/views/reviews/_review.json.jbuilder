json.extract! review, :id, :rating, :comment, :user_id, :trail_id, :date, :created_at, :updated_at
json.url review_url(review, format: :json)
