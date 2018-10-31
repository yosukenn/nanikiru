json.set! :coordinate do
  json.extract! @coordinate, :id, :name, :image, :gender_id, :user_id
  json.updated_at calc_time(coordinate)
  json.current_user_id current_user.id
end

json.set! :categorys do
  json.array! @categorys, :name, :color
end
