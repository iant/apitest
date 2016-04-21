json.array!(@items) do |item|
  json.extract! item, :id, :title, :body
  json.url item_url(item, format: :json)
end
