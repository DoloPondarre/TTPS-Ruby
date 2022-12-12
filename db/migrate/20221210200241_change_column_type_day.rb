class ChangeColumnTypeDay < ActiveRecord::Migration[7.0]
  def change
    change_column(:schedules, :day, :integer, default: 0)
  end
end
