class AddBornToProfiles < ActiveRecord::Migration[5.0]
  def change
      add_column :profiles, :born, :datetime
  end
end
