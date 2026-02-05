class AddAddressToListings < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :address, :string
    add_column :listings, :city, :string
    add_column :listings, :postalCode, :string
  end
end
