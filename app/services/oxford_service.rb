class OxfordService

  attr_reader :response, :word

  def initialize(word)
    @word = word.downcase
  end

  def conn
    Faraday.new(:url => 'https://od-api.oxforddictionaries.com') do |faraday|
      faraday.headers['app_id'] = ENV["app_id"]
      faraday.headers['app_key'] = ENV["app_key"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def inflection_response
    conn.get("/api/v1/inflections/en/#{word}")
  end

  def word_validation
    response ||= inflection_response
    if response.status == 200
      return "'#{word}' is a valid word and its root form is '#{parse(response)[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]}'."
    else
      return "'#{word}' is not a valid word."
    end
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
