class EmployeesController < ApplicationController
  include ApplicationHelper
  before_filter :check_signed_in
  
  def index
    @employee = Employee.find_by(auth_token: current_employee.auth_token)   
  end  
end
