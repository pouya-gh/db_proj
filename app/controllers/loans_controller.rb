class LoansController < ApplicationController
  include ApplicationHelper
  before_filter :check_signed_in

  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
    @customers = LcRelationship.where(loan_id: params[:id])
  end

  def new
    @loan = Loan.new
    respond_to do |format|
      format.html
    end
  end

  def create
    if customer = Customer.find_by(ssn: params[:loan][:customer_id]) 
      loan = Loan.create(lo_type: params[:loan][:lo_type],
                         amount: params[:loan][:amount],
                         branch_id: params[:loan][:branch_id])
      if loan.save
        flash[:success] = "Loan added successfully!"
        LcRelationship.create(loan_id: loan.loan_no, 
                              customer_id: params[:loan][:customer_id]).save
        redirect_to current_employee
      else
        flash[:danger] = "Failed!"
        redirect_to current_employee
      end
    else
      flash[:danger] = "Customer ID invalid!"
      redirect_to current_employee
    end
  end

  def destroy
    loan = Loan.find(params[:id])
    loan.destroy
    redirect_to current_employee
  end
end
