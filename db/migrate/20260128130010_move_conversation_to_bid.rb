class MoveConversationToBid < ActiveRecord::Migration[8.1]
  def change
    add_reference :conversations, :bid, foreign_key: true, index: true

    remove_reference :conversations, :listing, foreign_key: true
  end
end
