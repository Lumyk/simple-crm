json.array!(@prodacts) do |prodact|
  json.extract! prodact, :id
  json.url prodact_url(prodact, format: :json)
end
