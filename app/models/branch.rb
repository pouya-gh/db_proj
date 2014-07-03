class Branch < ActiveRecord::Base
  belongs_to :bank
  has_many :accounts, dependent: :destroy
  has_many :loans, dependent: :destroy
end
