class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.date :day
      t.time :hourI
      t.time :hourF
      t.belongs_to :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
