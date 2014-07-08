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

  def banks_report
    report = ThinReports::Report.new layout: "#{Rails.root}/reports/advanced_list.tlf"
     
    report.layout.config.list(:advanced_list) do
    # Define the variables used in list.
    use_stores :row_count => 0,
    :total_row_count => 0
    # Dispatched at list-page-footer insertion.
    events.on :page_footer_insert do |e|
    e.section.item(:page_footer).value("Page row count: #{e.store.row_count - 1}")
    e.store.total_row_count += e.store.row_count
    e.store.row_count = 0;
    end
    # Dispatched at list-footer insertion.
    events.on :footer_insert do |e|
    e.section.item(:footer).value("Row count: #{e.store.total_row_count - 1}")
    end
    end
     
    report.start_new_page
    banks = Bank.all
    report.page.list(:advanced_list) do |list|
      list.add_row :detail => "Bank ID*Name*Address"
      list.store.row_count += 1
    end
    banks.each do |t|
      # Internaly #start_new_page() method is called,
      # the page break automatically.
      report.page.list(:advanced_list) do |list|
        list.add_row :detail => "#{t.code}*#{t.name}*#{t.address}"
        list.store.row_count += 1
      end
    end

    send_data report.generate, :filename    => 'banks.pdf', 
                               :type        => 'application/pdf', 
                               :disposition => 'attachment' 
  end

  def customers_report
    report = ThinReports::Report.new layout: "#{Rails.root}/reports/advanced_list.tlf"
     
    report.layout.config.list(:advanced_list) do
    # Define the variables used in list.
    use_stores :row_count => 0,
    :total_row_count => 0
    # Dispatched at list-page-footer insertion.
    events.on :page_footer_insert do |e|
    e.section.item(:page_footer).value("Page row count: #{e.store.row_count - 1}")
    e.store.total_row_count += e.store.row_count
    e.store.row_count = 0;
    end
    # Dispatched at list-footer insertion.
    events.on :footer_insert do |e|
    e.section.item(:footer).value("Row count: #{e.store.total_row_count - 1}")
    end
    end
     
    report.start_new_page
    customers = Customer.all
    report.page.list(:advanced_list) do |list|
      list.add_row :detail => "SSN*Name*Address*Phone"
      list.store.row_count += 1
    end
    customers.each do |t|
      # Internaly #start_new_page() method is called,
      # the page break automatically.
      report.page.list(:advanced_list) do |list|
        list.add_row :detail => "#{t.ssn}*#{t.name}*#{t.address}*#{t.phone}"
        list.store.row_count += 1
      end
    end

    send_data report.generate, :filename    => 'customers.pdf', 
                               :type        => 'application/pdf', 
                               :disposition => 'attachment' 
  end

  def branches_report
    report = ThinReports::Report.new layout: "#{Rails.root}/reports/advanced_list.tlf"
     
    report.layout.config.list(:advanced_list) do
    # Define the variables used in list.
    use_stores :row_count => 0,
    :total_row_count => 0
    # Dispatched at list-page-footer insertion.
    events.on :page_footer_insert do |e|
    e.section.item(:page_footer).value("Page row count: #{e.store.row_count - 1}")
    e.store.total_row_count += e.store.row_count
    e.store.row_count = 0;
    end
    # Dispatched at list-footer insertion.
    events.on :footer_insert do |e|
    e.section.item(:footer).value("Row count: #{e.store.total_row_count - 1}")
    end
    end
     
    report.start_new_page
    branches = Branch.all
    report.page.list(:advanced_list) do |list|
      list.add_row :detail => "ID*Address*Bank ID"
      list.store.row_count += 1
    end
    branches.each do |t|
      # Internaly #start_new_page() method is called,
      # the page break automatically.
      report.page.list(:advanced_list) do |list|
        list.add_row :detail => "#{t.branch_no}*#{t.address}*#{t.bank_id}"
        list.store.row_count += 1
      end
    end

    send_data report.generate, :filename    => 'branches.pdf', 
                               :type        => 'application/pdf', 
                               :disposition => 'attachment' 
  end

  def accounts_report
    report = ThinReports::Report.new layout: "#{Rails.root}/reports/advanced_list.tlf"
     
    report.layout.config.list(:advanced_list) do
    # Define the variables used in list.
    use_stores :row_count => 0,
    :total_row_count => 0
    # Dispatched at list-page-footer insertion.
    events.on :page_footer_insert do |e|
    e.section.item(:page_footer).value("Page row count: #{e.store.row_count - 1}")
    e.store.total_row_count += e.store.row_count
    e.store.row_count = 0;
    end
    # Dispatched at list-footer insertion.
    events.on :footer_insert do |e|
    e.section.item(:footer).value("Row count: #{e.store.total_row_count - 1}")
    end
    end
     
    report.start_new_page
    accounts = Account.all
    report.page.list(:advanced_list) do |list|
      list.add_row :detail => "ID*Type*Balance*Branch ID"
      list.store.row_count += 1
    end
    accounts.each do |t|
      # Internaly #start_new_page() method is called,
      # the page break automatically.
      report.page.list(:advanced_list) do |list|
        list.add_row :detail => "#{t.acct_no}*#{t.ac_type}*#{t.balance}*#{t.branch_id}"
        list.store.row_count += 1
      end
    end

    send_data report.generate, :filename    => 'accounts.pdf', 
                               :type        => 'application/pdf', 
                               :disposition => 'attachment' 
  end

  def loans_report
    report = ThinReports::Report.new layout: "#{Rails.root}/reports/advanced_list.tlf"
     
    report.layout.config.list(:advanced_list) do
    # Define the variables used in list.
    use_stores :row_count => 0,
    :total_row_count => 0
    # Dispatched at list-page-footer insertion.
    events.on :page_footer_insert do |e|
    e.section.item(:page_footer).value("Page row count: #{e.store.row_count - 1}")
    e.store.total_row_count += e.store.row_count
    e.store.row_count = 0;
    end
    # Dispatched at list-footer insertion.
    events.on :footer_insert do |e|
    e.section.item(:footer).value("Row count: #{e.store.total_row_count - 1}")
    end
    end
     
    report.start_new_page
    loans = Loan.all
    report.page.list(:advanced_list) do |list|
      list.add_row :detail => "ID*Type*Amount*Branch ID"
      list.store.row_count += 1
    end
    loans.each do |t|
      # Internaly #start_new_page() method is called,
      # the page break automatically.
      report.page.list(:advanced_list) do |list|
        list.add_row :detail => "#{t.loan_no}*#{t.lo_type}*#{t.amount}*#{t.branch_id}"
        list.store.row_count += 1
      end
    end

    send_data report.generate, :filename    => 'loans.pdf', 
                               :type        => 'application/pdf', 
                               :disposition => 'attachment' 
  end
end
