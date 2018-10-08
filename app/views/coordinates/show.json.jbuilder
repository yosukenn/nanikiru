json.set! :coordinate do
  json.extract! @coordinate, :id, :name, :image, :gender_id, :user_id, :updated_at
end

json.set! :categorys do
  json.array! @categorys, :name, :color
end
