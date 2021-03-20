class Listing < ApplicationRecord
    has_one_attached :photo
    belongs_to :user

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :description, :lost_date, :completed, :image, :username)
    end
end