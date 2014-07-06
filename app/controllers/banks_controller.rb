class BanksController < ApplicationController
  include ApplicationHelper
  before_filter :check_signed_in

  def index
    @banks = Bank.all
  end

  def show
    @bank = Bank.find(params[:id])
    @branches = Bank.where(bank_id: params[:id])
  end

  def new
    @bank = Bank.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @bank = Bank.create(params[:bank])
    if @bank.save
      flash[:success] = "Bank added successfully"
      redirect_to current_employee
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
