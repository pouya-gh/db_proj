class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers, primary_key: :ssn do |t|
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
