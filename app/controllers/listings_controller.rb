class ListingsController < ApplicationController
  before_action :set_listing, only: [:update]
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

  def update
    @listing.active = false
    if @listing.save
      redirect_to listings_path
    else
      render :index
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:text, :title, photos: [])
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
