class RemoveQueryStringFromQueries < ActiveRecord::Migration
  def change
    remove_column :queries, :query_string, :string
  end
end
