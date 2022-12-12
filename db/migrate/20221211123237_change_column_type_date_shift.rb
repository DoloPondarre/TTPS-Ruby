class ChangeColumnTypeDateShift < ActiveRecord::Migration[7.0]
  def change
    change_column(:shifts, :date, :date)
  end
end
