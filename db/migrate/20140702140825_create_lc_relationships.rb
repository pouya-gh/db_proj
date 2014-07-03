class CreateLcRelationships < ActiveRecord::Migration
  def change
    create_table :lc_relationships do |t|
      t.belongs_to :loan
      t.belongs_to :customer

      t.timestamps
    end
  end
end
