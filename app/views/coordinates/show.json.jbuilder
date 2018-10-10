json.set! :coordinate do
  json.extract! @coordinate, :id, :name, :image, :gender_id, :user_id, :updated_at
  json.current_user_id current_user.id
end

json.set! :categorys do
  json.array! @categorys, :name, :color
end
