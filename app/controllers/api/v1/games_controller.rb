class Api::V1::GamesController < Api::V1::BaseController
  before_action :set_game, only: [ :show ]

  def index
    @games = Game.all
    @total_games = @games.count
  end

  def show
  end

  def create 
    @game = Game.create!()
    @move = Move.new(name: move_params[:name], move: move_params[:move].downcase, game_id: @game.id)
    if @move.save
      Move.create!(name: "bot", move: choose_move_bot, game_id: @game.id)
      @game.result = result_message
      @game.save!
      render :show, status: :created
    else
      @game.destroy
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

  def render_error
    render json: { errors: "wrong move" },
      status: :unprocessable_entity
  end

  def result_message
    case @game.moves.first.move.downcase
    when "scissor"
      if @game.moves.last.move == "paper"
        message = "#{@game.moves.first.name} win"
      elsif @game.moves.last.move == "rock"
        message = "#{@game.moves.first.name} lose"
      else
        message = "it'a tie for #{@game.moves.first.name} and the bot"
      end
    when "paper"
      if @game.moves.last.move == "paper"
        message = "it'a tie for #{@game.moves.first.name} and the bot"
      elsif @game.moves.last.move == "rock"
        message = "#{@game.moves.first.name} win"
      else
        message = "#{@game.moves.first.name} lose"
      end
    else
      if @game.moves.last.move == "paper"
        message = "#{@game.moves.first.name} lose"
      elsif @game.moves.last.move == "rock"
        message = "it'a tie for #{@game.moves.first.name} and the bot"
      else
        message = "#{@game.moves.first.name} win"
      end
    end
    return message
  end

end
