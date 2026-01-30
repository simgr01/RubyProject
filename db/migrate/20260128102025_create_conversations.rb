class CreateConversations < ActiveRecord::Migration[8.1]
  def change
    create_table :conversations do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :company, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
