class TripPurpose < ActiveRecord::Base

  has_many :service_trip_purpose_maps

  attr_accessible :id, :name, :note, :active

end
