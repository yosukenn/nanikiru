json.set! :coordinates do
  json.array! @coordinates do |coordinate|
    json.extract! coordinate, :id, :name, :image, :gender_id, :user_id, :updated_at
  end
end
