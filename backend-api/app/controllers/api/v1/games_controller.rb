class Api::V1::GamesController < ApplicationController

  def index
    @games = Game.all
    @top_5 = Game.top_5_highest_scores

    render json: {
      games: @games,
      top_5: @top_5
      }, include: [:player], status: 200
  end

  def show 
    @game = Game.find(params[:id])

    render json: @game, include: [:player], status: 200

  end

  private

  def game_params
    params.require(:games).permit(:score, :rating, :player_id)
  end
  
end
