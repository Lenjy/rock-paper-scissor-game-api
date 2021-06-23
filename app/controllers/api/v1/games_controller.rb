class Api::V1::GamesController < Api::V1::BaseController
  def index
    @games = Game.all
  end

  def create 
    @game = Game.create(game_params)
  end
end