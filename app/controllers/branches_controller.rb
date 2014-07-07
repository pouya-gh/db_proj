class BranchesController < ApplicationController
  include ApplicationHelper
  before_filter :check_signed_in

  def index
    @branches = Branch.all
  end

  def show
    @branch = Branch.find(params[:id])
  end

  def new
    @branch = Branch.new
    respond_to do |format|
      format.html
    end
  end

  def create
    if Bank.find_by(code: params[:branch][:bank_id].to_i)
      branch = Branch.create(address: params[:branch][:address],
                             bank_id: params[:branch][:bank_id])
      if branch.save
        flash[:success] = "Branch added successfully!"
        redirect_to current_employee
      else
        flash[:danger] = 'Failed!'
        redirect_to current_employee
      end
    else
      flash[:danger] = "Bank ID invalid!"
      redirect_to current_employee
    end
  end

  def destroy
    branch = Branch.find(params[:id])
    branch.destroy
    redirect_to current_employee
  end
end
