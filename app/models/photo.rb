class Photo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :user_id, :image,:location, :lon,:lat

  geocoded_by :location, :latitude  => :lat, :longitude => :lon
after_validation :geocode, :if => :location_changed?

  mount_uploader :image, ImageUploader
 def mapped?
    if self.lat.blank? || self.lon.blank?
    false
    else
    true
    end
  end
  private
  def geocode_location

    photo_location = Geokit::Geocoders::GoogleGeocoder.geocode(self.location)

    if photo_location.success
    self.lat = photo_location.lat
    self.lon = photo_location.lng
    end

  end

 
end
