json.array!(@users) do |user|
  json.extract! user, :id, :f_name, :l_name, :email, :password_digest, :active, :address1, :address2, :phone, :city, :state, :zip, :organization
  json.url user_url(user, format: :json)
end
