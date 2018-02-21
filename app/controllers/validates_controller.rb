class ValidatesController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://od-api.oxforddictionaries.com') do |faraday|
      faraday.headers['app_id'] = ENV["app_id"]
      faraday.headers['app_key'] = ENV["app_key"]
      faraday.adapter  Faraday.default_adapter
    end
    response = conn.get("/api/v1/inflections/en/#{params[:enter_word].downcase}")
    validation = JSON.parse(response.body, symbolize_names: true)
    if response.status == 200
      flash[:notice] = "'#{params[:enter_word].downcase}' is a valid word and its root form is '#{validation[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]}'."
    else
      flash[:notice] = "'foxez' is not a valid word."
    end
    redirect_to root_path
  end
end
