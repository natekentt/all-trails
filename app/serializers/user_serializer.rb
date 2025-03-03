class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :first_name, :last_name, :profile_picture, :bio

  # Include has_many relationships here as needed.  For example, if you want to include Reviews:
  has_many :reviews
end
