  class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :event
  
  has_many :requests, foreign_key: :requester_id, class_name: 'Event'
  has_many :responses, foreign_key: :responder_id, class_name: 'Event'

	geocoded_by :home_base, :latitude => :hb_latitude, :longitude => :hb_longitude #address field for user
  after_validation :geocode

  def nearby_requests
    # Event.where(active: true).near([self.hb_latitude, self.hb_longitude], self.hb_radius)
    Event.where(active: true).near(self, self.hb_radius)
  end

  def distance_to(request)
    self.distance_to(event).round(2)
  end

  def gain_karma
    self.karma_count += 10
    self.save
  end

  def fulfilled_requests_made
    self.requests.where.not(responder_id: nil)
  end

  def pending_requests_made
    self.requests.where(responder_id: nil)
  end
  # def nearby_users
  # 	self.nearbys(self.hb_radius)
  # end 
end