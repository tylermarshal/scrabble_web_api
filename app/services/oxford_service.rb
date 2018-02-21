class OxfordService

  def conn
    Faraday.new(:url => 'https://od-api.oxforddictionaries.com') do |faraday|
      faraday.headers['app_id'] = ENV["app_id"]
      faraday.headers['app_key'] = ENV["app_key"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def word_validation(word)
    response = conn.get("/api/v1/inflections/en/#{word.downcase}")
    if response.status == 200
      validation = JSON.parse(response.body, symbolize_names: true)
      return "'#{word.downcase}' is a valid word and its root form is '#{validation[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]}'."
    else
      return "'#{word.downcase}' is not a valid word."
    end
  end



end
