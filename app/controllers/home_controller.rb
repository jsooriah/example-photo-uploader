class HomeController < ApplicationController
  def index
  @photos = Photo.order("created_at DESC").limit(6)
  end
end
