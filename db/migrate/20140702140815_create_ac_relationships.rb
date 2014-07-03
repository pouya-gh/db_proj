class CreateAcRelationships < ActiveRecord::Migration
  def change
    create_table :ac_relationships do |t|
      t.belongs_to :account
      t.belongs_to :customer

      t.timestamps
    end
  end
end
