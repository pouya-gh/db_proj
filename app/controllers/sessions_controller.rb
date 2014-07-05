class SessionsController < ApplicationController
  before_filter :check_signed_in, except: [:destroy]

  def new
    
  end

  def create
    employee = Employee.find_by(email: params[:session][:email])
    if employee && employee.authenticate(params[:session][:password])
      sign_in employee
      redirect_to employee
    else
      flash.now[:danger] = "Username or password incorrect"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private
  
  def check_signed_in
    redirect_to current_user if signed_in?
  end
end
