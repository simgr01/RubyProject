class BidsController < ApplicationController
  before_action :set_listing
  load_and_authorize_resource

  def create
    @bid = @listing.bids.new(bid_params.merge(user: current_user))

    if @bid.save
      redirect_to @listing, notice: "Bid was successfully created."
    else
      redirect_to @listing, alert: @bid.errors.full_messages.to_sentence
    end
  end

  def accept
    authorize! :accept, @bid
    @bid.accept!
    Conversation.create!(listing: @bid.listing, user: @bid.listing.user, company: @bid.user)
    redirect_to @listing, notice: "Bid accepted"
  end

  def destroy
    authorize! :destroy, @bid
    if @bid.accepted
      @listing.update(status: "open")
      conversation = @listing.conversation.active.first
      conversation&.soft_delete!
    end
    @bid.soft_delete!
    redirect_to @listing
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def bid_params
    params.require(:bid).permit(:price, :message)
  end
end
