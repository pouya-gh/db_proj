class Account < ActiveRecord::Base
  belongs_to :branch
  has_many :ac_relationships, dependent: :destroy
  has_many :customers, through: :ac_relationships 
  validates :branch_id, presence: true
end
