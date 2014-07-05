module SessionsHelper
  def sign_in(employee)
    employee.regenerate_auth_token
    cookies[:auth_token] = employee.auth_token
    self.current_employee = employee
  end

  def current_employee=(employee)
    @current_employee = employee
  end

  def current_employee
    @current_employee ||= Employee.find_by(auth_token: cookies[:auth_token])
  end

  def sign_out
    self.current_employee = nil
    cookies.delete(:auth_token)
  end

  def signed_in?
    !self.current_employee.nil?
  end
end
