class AddQueryStringToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :query_string, :text
  end
end
