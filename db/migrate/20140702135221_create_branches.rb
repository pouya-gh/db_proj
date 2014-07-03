class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches, primary_key: :branch_no do |t|
      t.string :address
      t.belongs_to :bank

      t.timestamps
    end
  end
end
