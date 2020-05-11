json.array! @events do |event|
  json.id event.id
  json.text event.text
  json.image event.image
  json.user_id event.user_id
  json.nickname event.user.nickname
  json.user_sign_in current_user
end