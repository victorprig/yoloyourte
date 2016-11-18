class AddCoordinatesToYurts < ActiveRecord::Migration[5.0]
  def change
    add_column :yurts, :latitude, :float
    add_column :yurts, :longitude, :float
  end
end
