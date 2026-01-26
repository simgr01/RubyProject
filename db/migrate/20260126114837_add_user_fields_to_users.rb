class AddUserFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :address, :string
    add_column :users, :postalCode, :integer
    add_column :users, :city, :string
    add_column :users, :phoneNumber, :integer
  end
end
