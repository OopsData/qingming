json.array!(@changzous) do |changzou|
  json.extract! changzou, :id, :name, :mobile
  json.url changzou_url(changzou, format: :json)
end
