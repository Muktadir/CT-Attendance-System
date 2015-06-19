class RegistrationsController < Devise::RegistrationsController

  def destroy
    @employee = Employee.find(params[:id])

    if @employee.destroy
      root_path
    end
  end

  private
  def sign_up_params
    params.require(:employee).permit(:firstname, :lastname, :admin, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:employee).permit(:firstname, :lastname, :admin, :email, :password, :password_confirmation, :current_password)
  end


end
