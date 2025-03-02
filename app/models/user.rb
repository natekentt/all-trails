class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true # Optional email validation
  has_many :reviews
end
