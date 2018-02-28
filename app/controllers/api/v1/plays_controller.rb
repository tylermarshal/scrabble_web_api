class Api::V1::PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  before_action :set_game, only: [:create]

  def create
    if OxfordService.new(params[:word]).inflection_response.status == 200
      @game.plays.create!(play_params)
    else
      render json: {"message": "#{params[:word]} is not a valid word."}
    end
  end

  private

    def set_game
      @game = Game.find(params[:game_id])
    end

    def play_params
      params.permit(:user_id, :word)
    end

end
