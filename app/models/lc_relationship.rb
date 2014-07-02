class LcRelationship < ActiveRecord::Base
  belongs_to :loan
  belongs_to :customer
end
