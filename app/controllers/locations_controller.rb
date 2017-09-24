class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end
  def show
    @location = Location.friendly.find(params[:slug])
    @locationposts = @location.posts.order(created_at: :desc).page(params[:page]).per(4)
  end

end
