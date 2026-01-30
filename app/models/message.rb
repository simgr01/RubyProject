class Message < ApplicationRecord
    include SoftDeletable
    
    belongs_to :conversation
    belongs_to :sender, class_name: "User"
  
    validates :body, presence: true
  end
  