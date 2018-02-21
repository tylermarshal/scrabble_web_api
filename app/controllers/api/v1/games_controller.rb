class Api::V1::GamesController < ApplicationController

  before_action :set_game, only: [:show]
  
  def show
    render json: @game, each_serializer: GameSerializer
  end

  private

    def set_game
      @game = Game.find(params[:id])
    end

end
