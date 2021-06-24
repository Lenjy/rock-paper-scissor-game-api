# json.number @total_games

json.array! @games do |game|
  json.moves game.moves, :name, :move
  json.result game.result
  json.timestamps game.created_at
end
