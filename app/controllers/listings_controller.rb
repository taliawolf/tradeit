class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.save
    if @listing.save
      redirect_to listings_path, notice: 'added!'
    else
      render :new
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:text, :title)
  end
end
