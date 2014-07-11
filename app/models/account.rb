class Account < ActiveRecord::Base
  belongs_to :branch
  has_many :ac_relationships, dependent: :destroy
  has_many :customers, through: :ac_relationships 
  validates :branch_id, presence: true

  after_commit :increase_branch_asset, on: [:create]
  before_destroy :decrease_branch_asset

  def increase_branch_asset
    branch = Branch.find(self.branch_id)
    branch.asset += self.balance
    branch.save
  end

  def decrease_branch_asset
    branch = Branch.find(self.branch_id)
    branch.asset -= self.balance
    branch.save
  end
end
