class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :sur_name, :string
    add_column :users, :status, :boolean
  end
end
