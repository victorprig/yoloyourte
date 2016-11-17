class AddPhotoToYurt < ActiveRecord::Migration[5.0]
  def change
    add_column :yurts, :photo, :string
  end
end
