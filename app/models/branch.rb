class Branch < ActiveRecord::Base
  belongs_to :bank
  has_many :accounts
  has_many :loans
end
