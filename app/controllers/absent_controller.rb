class AbsentController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
  end

  def new
    @absent = Attendance.new
    respond_with(@absent)
  end

  def create
    @absent = Attendance.new(absent_params)
    respond_with(@absent)
    if @absent.save
      root_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_absent
    @absent = Attendance.find(params[:id])
  end

  def absent_params
    params.require(:attendance).permit(:firstname, :lastname, :date, :login_at, :logout_at, :present, :leave, :leave_cause, :working_hours)
  end

end
