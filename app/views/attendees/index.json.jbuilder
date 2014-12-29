json.array!(@attendees) do |attendee|
  json.extract! attendee, :id, :volunteer
  json.url attendee_url(attendee, format: :json)
end
