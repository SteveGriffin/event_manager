json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :start_date, :end_date, :recurring
  json.url subscription_url(subscription, format: :json)
end
