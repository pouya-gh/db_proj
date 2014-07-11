class Query < ActiveRecord::Base
  validates :query_string, presence: true
  validates :description, presence: true
  validates :report_order, presence: true

  def sql
    ActiveRecord::Base.connection.execute(self.query_string).as_json
  end
end
