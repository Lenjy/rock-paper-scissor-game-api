json.array! @games do |game|
  json.array! game.moves do |move|
    json.extract! move, :name, :move
  end
  json.extract! game, :result
end