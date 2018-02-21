class ValidatesController < ApplicationController
  def index
    flash[:notice] = OxfordService.new(params[:enter_word]).word_validation
    redirect_to root_path
  end
end
