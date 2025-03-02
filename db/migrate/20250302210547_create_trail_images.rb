class CreateTrailImages < ActiveRecord::Migration[8.0]
  def change
    create_table :trail_images do |t|
      t.references :trail, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
