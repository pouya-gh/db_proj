class AddAssetToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :asset, :integer
  end
end
