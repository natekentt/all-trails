# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# db/seeds.rb

# Delete existing data to start fresh (optional, but recommended)
puts "Destroying existing data..."
Review.destroy_all
Trail.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create!(
  email: 'user1@example.com',
  password: 'password', # Remember to use has_secure_password in your User model!
  first_name: 'Alice',
  last_name: 'Smith',
  bio: 'Avid hiker and nature enthusiast.'
)

user2 = User.create!(
  email: 'user2@example.com',
  password: 'password',
  first_name: 'Bob',
  last_name: 'Johnson',
  bio: 'Enjoying the great outdoors, one trail at a time.'
)

puts "Creating trails..."
trail1 = Trail.create!(
  name: 'Mountaintop Vista Trail',
  description: 'A challenging hike with stunning panoramic views.',
  difficulty: :hard,  # Using enum
  length: 8.5,
  elevation_gain: 2500,
  route_type: :out_and_back, # Using enum
  latitude: 34.0522,
  longitude: -118.2437,
  address: '123 Main St',
  city: 'Los Angeles',
  state: 'CA',
  country: 'USA',
  zip_code: '90001',
  average_rating: 4.5,
  image_url: 'https://example.com/trail1.jpg', # Replace with a real URL
)

trail2 = Trail.create!(
  name: 'Riverside Loop',
  description: 'An easy and scenic loop along the river.',
  difficulty: :easy,
  length: 3.2,
  elevation_gain: 100,
  route_type: :loop,
  latitude: 37.7749,
  longitude: -122.4194,
  address: '456 Oak Ave',
  city: 'San Francisco',
  state: 'CA',
  country: 'USA',
  zip_code: '94102',
  average_rating: 4.2,
  image_url: 'https://example.com/trail2.jpg'
)

trail3 = Trail.create!(
  name: 'Forest Grove Trail',
  description: 'A moderate trail through a dense forest.',
  difficulty: :moderate,
  length: 5.8,
  elevation_gain: 800,
  route_type: :out_and_back,
  latitude: 40.7128,
  longitude: -74.0060,
  address: '789 Pine Ln',
  city: 'New York',
  state: 'NY',
  country: 'USA',
  zip_code: '10001',
  average_rating: 4.7,
  image_url: 'https://example.com/trail3.jpg'
)

trail4 = Trail.create!(
  name: 'Canyon Rim Hike',
  description: 'Hike with beautiful canyon views',
  difficulty: :moderate,
  length: 7.0,
  elevation_gain: 900,
  route_type: :point_to_point,
  latitude: 33.4484,
  longitude: -112.0740,
  address: '22 Canyon Drive',
  city: 'Phoenix',
  state: 'AZ',
  country: 'USA',
  zip_code: '85003',
  average_rating: 4.0,
  image_url: 'https://example.com/trail4.jpg'
)

trail5 = Trail.create!(
  name: 'Summit Peak Challenge',
  description: 'Extremely difficult, very rewarding hike',
  difficulty: :hard,
  length: 12.5,
  elevation_gain: 4200,
  route_type: :out_and_back,
  latitude: 47.6062,
  longitude: -122.3321,
  address: '99 Summit Rd',
  city: 'Seattle',
  state: 'WA',
  country: 'USA',
  zip_code: '98101',
  average_rating: 4.9,
  image_url: 'https://example.com/trail5.jpg'
)

puts "Creating reviews..."
Review.create!(
  rating: 5,
  comment: 'Amazing trail! The views were incredible.',
  user: user1,
  trail: trail1,
  date: Date.today - 2.days
)

Review.create!(
  rating: 4,
  comment: 'Enjoyed the hike, but it was definitely challenging.',
  user: user2,
  trail: trail1,
  date: Date.today - 5.days
)

Review.create!(
  rating: 5,
  comment: 'Great for a leisurely stroll.',
  user: user1,
  trail: trail2,
  date: Date.today - 1.day
)

Review.create!(
  rating: 3,
  comment: 'Nice trail, but a bit crowded.',
  user: user2,
  trail: trail2,
  date: Date.today - 3.days
)

Review.create!(
  rating: 4,
  comment: 'Very peaceful and serene.',
  user: user1,
  trail: trail3,
  date: Date.today - 7.days
)

Review.create!(
  rating: 5,
  comment: 'Wonderful hike, highly recommend!',
  user: user2,
  trail: trail3,
  date: Date.today - 4.days
)

Review.create!(
  rating: 4,
  comment: 'Good hike with moderate challenges.',
  user: user1,
  trail: trail4,
  date: Date.today - 2.days
)

Review.create!(
  rating: 3,
  comment: 'Not my favorite, but had some nice views.',
  user: user2,
  trail: trail4,
  date: Date.today - 5.days
)

Review.create!(
  rating: 5,
  comment: 'The best challenge I have done, would definitely do it again.',
  user: user1,
  trail: trail5,
  date: Date.today - 3.days
)

Review.create!(
  rating: 4,
  comment: 'Wonderful views at the summit, but a long day of hiking.',
  user: user2,
  trail: trail5,
  date: Date.today - 6.days
)

puts "Seed data created!"
