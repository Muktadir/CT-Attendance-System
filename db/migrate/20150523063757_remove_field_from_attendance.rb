class RemoveFieldFromAttendance < ActiveRecord::Migration
  def change
    remove_column :attendances, :date, :Datetime
  end
end
