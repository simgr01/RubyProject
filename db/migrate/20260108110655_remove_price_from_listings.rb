class RemovePriceFromListings < ActiveRecord::Migration[8.1]
  def change
    remove_column :listings, :price, :integer
  end
end
