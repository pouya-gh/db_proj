class Loan < ActiveRecord::Base
  belongs_to :branch
  has_many :lc_relationships
  has_many :customers, through: :lc_relationships
end
