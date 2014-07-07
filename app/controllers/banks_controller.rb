class BanksController < ApplicationController
  include ApplicationHelper
  before_filter :check_signed_in

  def index
    @banks = Bank.all
  end

  def show
    @bank = Bank.find(params[:id])
    @branches = Branch.where(bank_id: params[:id])
  end

  def new
    @bank = Bank.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @bank = Bank.create(name: params[:bank][:name], 
                        address: params[:bank][:address])
    if @bank.save
      flash[:success] = "Bank added successfully"
      redirect_to banks_path
    else
      flash.now[:warning] = "Information invalid!"
      render :new
    end
  end

  def destroy
    bank = Bank.find(params[:id])
    bank.destroy
    redirect_to current_employee
  end
end
