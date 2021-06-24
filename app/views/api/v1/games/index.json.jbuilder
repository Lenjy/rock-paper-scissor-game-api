json.array! @games do |game|
  json.array! @game.moves, :name, :move
  json.extract! @game, :result
end