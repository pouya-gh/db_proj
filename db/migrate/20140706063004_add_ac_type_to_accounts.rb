class AddAcTypeToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :ac_type, :string
  end
end
