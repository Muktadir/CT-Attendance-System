class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :firstname
      t.string :lastname
      t.datetime :date
      t.time :login_at
      t.time :logout_at
      t.boolean :present
      t.boolean :leave
      t.string :leave_cause
      t.time :working_hours

      t.timestamps
    end
  end
end
