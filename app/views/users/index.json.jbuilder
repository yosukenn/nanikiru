json.set! :coordinates do
  json.array! @coordinates do |coordinate|
    json.extract! coordinate, :id, :name, :image, :gender_id, :user_id
    json.updated_at calc_time(coordinate)
  end
end
