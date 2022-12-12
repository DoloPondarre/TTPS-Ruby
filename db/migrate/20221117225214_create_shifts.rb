class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.datetime :date
      t.string :reason
      t.string :state
      t.string :comment
      t.references :client, null: false, foreign_key: {to_table: :users}
      t.references :staff, null: true, foreign_key: {to_table: :users}
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
