class WelcomeController < ApplicationController
  def index
    if params[:enter_word]
      @validation_response = OxfordService.new(params[:enter_word]).word_validation
    end
  end
end
