class Query < ActiveRecord::Base
  validates :query_string, presence: true
  validates :description, presence: true
  validates :report_order, presence: true
end
