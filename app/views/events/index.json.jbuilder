json.array!(@events) do |event|
  json.extract! event, :id, :date, :end_date, :start_time, :end_time, :paid, :private, :description, :document, :event_cap
  json.url event_url(event, format: :json)
end
