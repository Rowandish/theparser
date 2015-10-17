json.array!(@films) do |film|
  json.extract! film, :id, :name, :date, :cinema_id
  json.url film_url(film, format: :json)
end
