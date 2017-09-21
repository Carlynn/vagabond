class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @locationposts = @location.posts.order(created_at: :desc)
  end
end
