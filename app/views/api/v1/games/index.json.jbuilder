json.array! @games do |game|
  json.extract! game, :name_user, :move_user, :move_bot, :result
end