class Event < ActiveRecord::Base
  belongs_to :requester, class_name: 'User'
  belongs_to :responder, class_name: 'User'

  reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode
end
