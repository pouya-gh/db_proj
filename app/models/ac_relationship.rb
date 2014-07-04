class AcRelationship < ActiveRecord::Base
  belongs_to :account
  belongs_to :customer
  validates :account_id, presence: true
  validates :customer_id, presence: true
end
