class ApplicationController < ActionController::Base
  before_filter :authenticate_employee!
  before_filter :set_cache_buster
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)

    $absent = Array.new

    @employee = Employee.all()
    date = Time.now.strftime("%d %B %Y").to_s
    @attendances_today = Attendance.where(:date => date )

    @employee.each do |emp|
      @present = false
      @attendances_today.each do |a|
        if emp.firstname == a.firstname
          @present = true
        end
      end
      if @present == false
        $absent.push(emp)
      end
    end

    present = true
    if $absent != nil
      $absent.each do |ab|
        if ab.firstname == current_employee.firstname
          present = false
          break
        end
      end
    end

    if present == false
      new_attendance_path
    else
      root_path
    end

  end


  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end


end
