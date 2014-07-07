class EmployeesController < ApplicationController
  include ApplicationHelper
  before_filter :check_signed_in
  
  def show
    @employee = Employee.find_by(auth_token: current_employee.auth_token)   
  end

  def backup
    if system("mysqldump -u root banks > #{Rails.root.to_s}/db/backup.sql")
      flash[:success] = "Successfully made a backup of your database!"
    else
      flash[:danger] = "Backing up proccess was unseccessful."
    end

    redirect_to current_employee
  end

  def restore
    if system("mysql -u root banks < #{Rails.root.to_s}/db/backup.sql")
      flash[:success] = "Backup successfully restored!"
    else
      flash[:danger] = "We couldn't restore database."
    end
    
    redirect_to current_employee
  end  
end
