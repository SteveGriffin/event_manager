json.array!(@plans) do |plan|
  json.extract! plan, :id, :plan_type, :plan_description, :price, :active, :recurring
  json.url plan_url(plan, format: :json)
end
