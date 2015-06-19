class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, password_length: 6..128

  def timeout_in
    10.hours
  end
  # validates :firstname, presence: true
  # validates :lastname, presence: true
  # validates :admin, presence: true

end
