class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :auth_token

      t.timestamps
    end
    add_index :employees, :email,      unique: true
    add_index :employees, :auth_token, unique: true
  end
end
