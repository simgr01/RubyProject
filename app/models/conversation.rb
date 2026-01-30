class Conversation < ApplicationRecord
    include SoftDeletable

    belongs_to :listing
  
    belongs_to :user, class_name: "User"
    belongs_to :company,  class_name: "User"
  
    has_many :messages
  
    def participant?(user)
        user == user.id || company == user.id
    end

    def soft_delete!
        transaction do
          super
          messages.find_each(&:soft_delete!)
        end
    end

  end
  