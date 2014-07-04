class LcRelationship < ActiveRecord::Base
  belongs_to :loan
  belongs_to :customer
  validates :loan_id, presence: true
  validates :customer_id, presence: true
end
