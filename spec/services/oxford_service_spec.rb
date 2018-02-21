require 'rails_helper'

describe OxfordService do
  it "exists" do
    word = "swim"
    oxford = OxfordService.new(word)

    expect(oxford).to be_a(OxfordService)
    expect(oxford.word).to eq(word)
  end
  context "Instance methods" do
    context "#conn" do
      it "returns a faraday connection" do
        word = "swim"
        oxford = OxfordService.new(word)

        expect(oxford.conn.class).to eq(Faraday::Connection)
      end
    end
    context "#inflection_response" do
      it "returns a successful response" do
        word = "swim"
        oxford = OxfordService.new(word)

        expect(oxford.inflection_response.status).to eq(200)
      end
    end
    context "#word_validation" do
      it "returns a success message for valid word" do
        word = "swims"
        oxford = OxfordService.new(word)

        expect(oxford.word_validation).to eq("'swims' is a valid word and its root form is 'swim'.")
      end
    end
    context "#word_validation" do
      it "returns a unsuccessful message for unvalid word" do
        word = "swimz"
        oxford = OxfordService.new(word)

        expect(oxford.word_validation).to eq("'swimz' is not a valid word.")
      end
    end
    context "#parse" do
      it "returns a unsuccessful message for unvalid word" do
        word = "swimmer"
        oxford = OxfordService.new(word)
        response = oxford.inflection_response

        expect(oxford.parse(response).class).to eq(Hash)
      end
    end
  end
end
