json.array!(@devices) do |device|
  json.extract! device, :id, :name, :location, :description, :ipaddress
  json.url device_url(device, format: :json)
end
