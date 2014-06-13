class Event < ActiveRecord::Base
  belongs_to :requester, class_name: 'User'
  belongs_to :responder, class_name: 'User'
end
