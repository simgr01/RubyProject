class ImagesController < ApplicationController
  before_action :set_listing

  def destroy
    #authorize! :destroy, @listing.images.find(params[:id])
    @listing.images.find(params[:id]).purge
    redirect_back fallback_location: listing_path(@listing)
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
end
