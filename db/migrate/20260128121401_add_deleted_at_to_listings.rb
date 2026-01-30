class AddDeletedAtToListings < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :deleted_at, :datetime
    add_index :listings, :deleted_at
  end
end
