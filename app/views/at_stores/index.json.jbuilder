json.array!(@at_stores) do |at_store|
  json.extract! at_store, :id
  json.url at_store_url(at_store, format: :json)
end
