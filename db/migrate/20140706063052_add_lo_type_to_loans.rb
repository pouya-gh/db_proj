class AddLoTypeToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :lo_type, :string
  end
end
