class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  respond_to :html
  def index
    $absent = Array.new

    @employee = Employee.all()
    date = Time.now.strftime("%d %B %Y").to_s
    @attendance = Attendance.new
    @attendances = Attendance.all
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
    # respond_with(@attendances)
  end

  def show
    respond_with(@attendance)
  end

  def new
    @attendance = Attendance.new
    respond_with(@attendance)
  end

  def edit
  end

  def create
    @attendance = Attendance.new(attendance_params)
    respond_with(@attendance)
    if @attendance.save
      root_path
    else
      new_attendance_path
    end
  end

  def update
    if @attendance.firstname == current_employee.firstname && @attendance.logout_at.nil?
      Time.zone = 'Dhaka'
      if @attendance.update_attribute(:logout_at, Time.now+6.hours)
        sign_out
        redirect_to new_employee_session_path
      end
    elsif @attendance.firstname != current_employee.firstname
      if @attendance.update(attendance_params)
        redirect_to root_path
      end
    end
  end

  def destroy
    @attendance.destroy
    respond_with(@attendance)
  end

  def by_name
    name = params[:name]
    if name.present?
      start_date = DateTime.parse(params["start_date"].values.join("-"))
      end_date = DateTime.parse(params["end_date"].values.join("-"))
    end
    @report_by_name = Attendance.where(created_at:  start_date..end_date).where(:firstname => name)
  end

  def by_date
    date = params[:start_date]
    if date.present?
      start_date = DateTime.parse(params["start_date"].values.join("-"))
      end_date = DateTime.parse(params["end_date"].values.join("-"))
    end
    @report_by_name = Attendance.where(created_at:  start_date..end_date)
  end

  def make_leave
    @employee = Employee.find(params[:e_id])
    @attendance = Attendance.new
    respond_with(@attendance)
  end

  def create_leave
    @attendance = Attendance.new(attendance_params)
    respond_with(@attendance)
    if @attendance.save
      root_path
    else
      new_attendance_path
    end

  end

  private
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(:firstname, :lastname, :email, :date.to_s, :login_at, :logout_at, :present, :leave, :leave_cause)
    end

end
