class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans, primary_key: :loan_no do |t|
      t.integer :amount
      t.string :type
      t.belongs_to :branch

      t.timestamps
    end
  end
end
