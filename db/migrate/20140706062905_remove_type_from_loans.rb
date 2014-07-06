class RemoveTypeFromLoans < ActiveRecord::Migration
  def change
    remove_column :loans, :type, :string
  end
end
