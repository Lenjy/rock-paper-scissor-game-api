class Api::V1::GamesController < Api::V1::BaseController
  before_action :set_game, only: [ :show ]

  def index
    @games = Game.all
  end

  def show
  end

  def create 
    @game = Game.new()
    @move = Move.new(name: params[:name], move: params[:move].downcase, game_id: @game)
    raise
    if @move.save
      Move.create(name: "bot", move: choose_move_bot, game_id: @game)
      @game.result = result_message
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def choose_move_bot
    return ["scissor", "paper", "rock"].sample
  end

  def move_params
    params.permit(:name, :move)
  end

  def result_message
    case @game.moves[0]
    when "scissor"
      if @game.moves[1] == "paper"
        message = "#{@game.moves[0].name} win"
      elsif @game.moves[1] == "rock"
        message = "#{@game.moves[0].name} lose"
      else
        message = "it'a tie for #{@game.moves[0].name} and the bot"
      end
    when "paper"
      if @game.moves[1] == "paper"
        message = "it'a tie for #{@game.moves[0].name} and the bot"
      elsif @game.moves[1] == "rock"
        message = "#{@game.moves[0].name} win"
      else
        message = "#{@game.moves[0].name} lose"
      end
    else
      if @game.moves[1] == "paper"
        message = "#{@game.moves[0].name} lose"
      elsif @game.moves[1] == "rock"
        message = "it'a tie for #{@game.moves[0].name} and the bot"
      else
        message = "#{@game.moves[0].name} win"
      end
    end
    return message
  end

end
