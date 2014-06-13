json.array!(@events) do |event|
  json.extract! event, :id, :requester_id, :responder_id, :latitude, :longitude, :active
  json.url event_url(event, format: :json)
end
