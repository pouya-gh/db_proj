class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, primary_key: :acct_no do |t|
      t.integer :balance
      t.string :type
      t.belongs_to :branch

      t.timestamps
    end
  end
end
