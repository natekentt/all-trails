class Trail < ApplicationRecord
  has_many :reviews
  has_many :trail_images, dependent: :destroy  # This is crucial!

  before_create :slugify
  before_validation :slugify, if: :name_changed?

  def slugify
    self.slug = name.parameterize
  end
  
  def avg_score
    reviews.average(:rating).round(2).to_f
  end
end
