class QueriesController < ApplicationController
  include ApplicationHelper
  before_filter :check_signed_in

  def index
    @queries = Query.all
  end

  def show
    @query = Query.find_by(id: params[:id])
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.create(query_string: params[:query][:query_string],
                          description: params[:query][:description],
                          report_order: params[:query][:report_order])
    if @query.save
      flash[:success] = "Query added successfully!"
      redirect_to queries_path
    else
      flash.now[:warning] = "It seems you forgot something."
      render :new
    end
  end

  def destroy
    query = Query.find_by(id: params[:id])
    query.destroy
    redirect_to queries_path
  end

  def execute_query
    query = Query.find(params[:id])
    @result = query.sql
  end

  def report_query
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
    query = Query.find(params[:id])
    result = query.sql
    report.page.list(:advanced_list) do |list|
      list.add_row :detail => query.report_order
      list.store.row_count += 1
    end
    result.each do |t|
      # Internaly #start_new_page() method is called,
      # the page break automatically.
      a_row = ""
      t.each do |r|
        a_row << "*#{r}"
      end
      a_row = a_row[1..-1]
      report.page.list(:advanced_list) do |list|
        list.add_row :detail => a_row
        list.store.row_count += 1
      end
    end

    send_data report.generate, :filename    => "query ##{query.id}.pdf", 
                               :type        => 'application/pdf', 
                               :disposition => 'attachment' 
  end
end
