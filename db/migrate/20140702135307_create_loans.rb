class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|

      t.timestamps
    end
  end
end
