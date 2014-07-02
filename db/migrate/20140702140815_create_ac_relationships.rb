class CreateAcRelationships < ActiveRecord::Migration
  def change
    create_table :ac_relationships do |t|

      t.timestamps
    end
  end
end
