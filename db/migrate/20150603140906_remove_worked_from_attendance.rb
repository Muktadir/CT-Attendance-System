class RemoveWorkedFromAttendance < ActiveRecord::Migration
  def change
    remove_column :attendances, :working_hours, :string
  end
end
