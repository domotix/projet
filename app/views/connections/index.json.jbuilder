json.array!(@devices) do |device|
  json.extract! device, :id, :name, :status
  json.url device_url(device, format: :json)
end
