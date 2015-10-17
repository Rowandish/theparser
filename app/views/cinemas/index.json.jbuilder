json.array!(@cinemas) do |cinema|
  json.extract! cinema, :id, :name, :address, :webpage, :promotion_name, :promotion_desc, :enabled
  json.url cinema_url(cinema, format: :json)
end
