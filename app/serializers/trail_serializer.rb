class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :difficulty, :length, :elevation_gain, :route_type, :latitude, :longitude, :address, :city, :state, :country, :zip_code, :average_rating, :image_url, :slug

  # Relationship Example - assuming you want to include reviews and park info
  has_many :reviews
  #belongs_to :park
  #has_many :trail_images
  #has_many :activities, through: :trail_activities
end
