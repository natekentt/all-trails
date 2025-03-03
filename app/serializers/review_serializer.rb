class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :rating, :comment, :date

  # Relationships
  belongs_to :user
  belongs_to :trail
end
