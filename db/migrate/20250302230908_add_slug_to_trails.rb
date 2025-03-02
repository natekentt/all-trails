class AddSlugToTrails < ActiveRecord::Migration[8.0]
  def change
    add_column :trails, :slug, :string
    add_index :trails, :slug, unique: true
  end
end
