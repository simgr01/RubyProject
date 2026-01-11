class AddAcceptedToBids < ActiveRecord::Migration[8.1]
  def change
    add_column :bids, :accepted, :boolean
  end
end
