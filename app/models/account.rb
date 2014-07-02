class Account < ActiveRecord::Base
  belongs_to :branch
  has_many :ac_relationships
  has_many :customers, through: :ac_relationships 
end
