class Loan < ActiveRecord::Base
  belongs_to :branch
  has_many :lc_relationships, dependent: :destroy
  has_many :customers, through: :lc_relationships
  validates :branch_id, presence: true
end
