class AddDefaultToListingsStatus < ActiveRecord::Migration[8.1]
  def change
    change_column_default :listings, :status, "open"
  end
end
