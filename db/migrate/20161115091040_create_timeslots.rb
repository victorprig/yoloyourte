class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :yurt, foreign_key: true
      t.timestamps
    end
  end
end
