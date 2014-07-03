class Customer < ActiveRecord::Base
  has_many :ac_relationships, dependent: :destroy
  has_many :lc_relationships, dependent: :destroy
  has_many :accounts, through: :ac_relationships
  has_many :loans, through: :lc_relationships
end
