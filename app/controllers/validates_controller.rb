class ValidatesController < ApplicationController
  def index
    flash[:notice] = OxfordService.new.word_validation(params[:enter_word])
    redirect_to root_path
  end
end
