json.extract! trail, :id, :name, :description, :difficulty, :length, :elevation_gain, :route_type, :latitude, :longitude, :address, :city, :state, :country, :zip_code, :average_rating, :image_url, :creator_id, :park_id, :created_at, :updated_at
json.url trail_url(trail, format: :json)
