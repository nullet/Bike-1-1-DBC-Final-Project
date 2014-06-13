class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests, foreign_key: :requester_id, class_name: 'Event'
  has_many :responses, foreign_key: :responder_id, class_name: 'Event'

	geocoded_by :home_base, :latitude => :hb_latitude, :longitude => :hb_longitude #address field for user
  after_validation :geocode

  # def nearby_events
  	# Event.nearbys(hb_radius)
  # end
  
  # def nearby_users
  # 	help_radius = self.hb_radius
  # 	needs_help = User.nearbys(help_radius)
  # 	#(where User's location is within hb_radius)
  # end 
end