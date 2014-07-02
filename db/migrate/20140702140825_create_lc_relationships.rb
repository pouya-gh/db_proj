class CreateLcRelationships < ActiveRecord::Migration
  def change
    create_table :lc_relationships do |t|

      t.timestamps
    end
  end
end
