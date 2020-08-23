class OffersController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @offer = Offer.new(offer_params)
    @offer.listing = @listing
    @offer.user = current_user
      if @offer.save
        redirect_to listings_path, notice: 'Your offer was successfully added.'
      else
        render :new
      end
  end

  private

  def offer_params
    params.require(:offer).permit(:text)
  end
end
