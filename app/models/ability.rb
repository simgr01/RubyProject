# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.customer?
      can :create, Listing
      can :read, Listing
      can [ :update, :destroy ], Listing, user_id: user.id
      can :read, Bid, listing: { user_id: user.id }
      can :accept, Bid, listing: { user_id: user.id }
    end

    if user.company?
      can :access, :company_dashboard
      can :create, Bid
      can :read, Bid, user_id: user.id
      can :read, Listing
    end
  end
end
