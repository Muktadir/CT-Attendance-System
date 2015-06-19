json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :firstname, :lastname, :date, :login_at, :logout_at, :present, :leave, :leave_cause, :working_hours
  json.url attendance_url(attendance, format: :json)
end
