class Customer < ActiveRecord::Base
  has_many :ac_relationships
  has_many :lc_relationships
  has_many :accounts, through: :ac_relationships
  has_many :loans, through: :lc_relationships
end
