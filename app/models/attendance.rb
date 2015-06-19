class Attendance < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :date, presence: true
  # validates :login_at, presence: true
  # validates :present, presence: true
  # validates :leave, presence: true
end
