module ApplicationHelper

  private
  
  def check_signed_in
    unless signed_in?
      flash[:warning] = "You are not signed in."
      redirect_to root_path
    end
  end
end
