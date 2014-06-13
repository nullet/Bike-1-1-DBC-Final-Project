class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :requests, foreign_key: :requester_id, class_name: 'Event'
  has_many :responses, foreign_key: :responder_id, class_name: 'Event'


end