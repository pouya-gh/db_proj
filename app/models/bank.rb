class Bank < ActiveRecord::Base
  has_many :branches, dependent: :destroy
end
