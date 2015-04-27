json.array!(@users) do |user|
  json.extract! user, :id, :name, :sex
  json.url user_url(user, format: :json)
end
