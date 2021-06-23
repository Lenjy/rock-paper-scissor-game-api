class Api::V1::GamesController < Api::V1::BaseController
  def index
    @games = Game.all
  end

  def create 
    @game = Game.new(game_params)
    @game.move_bot = choose_move_bot
    @game.result = result_message
    if @game.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def choose_move_bot
    return ["scissor", "paper", "rock"].sample
  end

  def result_message
    message = ""
    case @game.move_user.downcase
    when "scissor"
      if @game.move_bot == "paper"
        message = "#{@game.name_user} win"
      elsif @game.move_bot == "rock"
        message = "#{@game.name_user} lose"
      else
        message = "it'a tie for #{@game.name_user} and the bot"
      end
    when "paper"
      if @game.move_bot == "paper"
        message = "it'a tie for #{@game.name_user} and the bot"
      elsif @game.move_bot == "rock"
        message = "#{@game.name_user} win"
      else
        message = "#{@game.name_user} lose"
      end
    when "rock"
      if @game.move_bot == "paper"
        message = "#{@game.name_user} lose"
      elsif @game.move_bot == "rock"
        message = "it'a tie for #{@game.name_user} and the bot"
      else
        message = "#{@game.name_user} win"
      end
    else
      message = "Error"
    end
    return message
  end
end