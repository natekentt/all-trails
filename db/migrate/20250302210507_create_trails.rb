class CreateTrails < ActiveRecord::Migration[8.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.text :description
      t.integer :difficulty
      t.decimal :length
      t.integer :elevation_gain
      t.integer :route_type
      t.decimal :latitude
      t.decimal :longitude
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.decimal :average_rating
      t.string :image_url
      t.integer :creator_id
      t.integer :park_id

      t.timestamps
    end
  end
end
