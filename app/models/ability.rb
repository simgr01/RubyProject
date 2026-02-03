# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.customer?
      can :create, Listing
      can :read, Listing, user_id: user.id
      can [ :update, :destroy ], Listing, user_id: user.id
      can :read, Bid, listing: { user_id: user.id }
      can :accept, Bid, listing: { user_id: user.id }

      can :read, Conversation, user_id: user.id
      can :create, Message, conversation: { user_id: user.id }
      
      can :destroy, ActiveStorage::Attachment do |attachment|
        attachment.record.user_id == user.id
      end
      
    end

    if user.company?
      can :read, Listing
      can :create, Bid
      can :destroy, Bid, user_id: user.id 
      can :read, Bid
      can :read, Listing

      can :read, Conversation, company_id: user.id
      can :create, Message, conversation: { company_id: user.id }
    end
  end
end
