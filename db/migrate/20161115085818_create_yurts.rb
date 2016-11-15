class CreateYurts < ActiveRecord::Migration[5.0]
  def change
    create_table :yurts do |t|
      t.text :description
      t.string :name
      t.string :location
      t.integer :daily_rate
      t.string :shape
      t.string :climate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
