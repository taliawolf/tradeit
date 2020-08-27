class OffersController < ApplicationController
  # before_action :set_listing, only: [:create, :update]
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

  # def update
  #   # @listing = Listing.find(params[:listing_id])
  #   @offer = Offer.find(params[:id])
  #   @listing.active = false
  #   if @offer.save
  #     redirect_to listings_path
  #   else
  #     render :index
  #   end
  # end

  private

  def offer_params
    params.require(:offer).permit(:text)
  end

  # def set_listing
  #   @listing = Listing.find(params[:listing_id])
  # end
end
