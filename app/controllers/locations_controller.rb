class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end
  def show
    @location = Location.friendly.find(params[:id])
    # @location = Location.find params[:id]
    @locationposts = @location.posts.order(created_at: :desc)

  end
end
