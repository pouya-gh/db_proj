class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :query_string
      t.string :description
      t.string :report_order

      t.timestamps
    end
  end
end
