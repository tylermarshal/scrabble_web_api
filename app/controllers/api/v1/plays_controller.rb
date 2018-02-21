class Api::V1::PlaysController < ApplicationController

  before_action :set_game, only: [:create]

  def create
    @game.plays.create!(play_params)
  end

  private

    def set_game
      @game = Game.find(params[:game_id])
    end

    def play_params
      params.permit(:user_id, :word)
    end

end
