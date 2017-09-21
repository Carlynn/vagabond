class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:location_id])
    @locationposts = @location.posts.order(created_at: :desc)
  end
end
