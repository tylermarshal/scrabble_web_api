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
#     context "#word_validation" do
#       it "returns a success message" do
#         word = "swimmer"
#         oxford = OxfordService.new(word)
# require "pry"; binding.pry
#         expect(oxford.word_validation).to be_successful
#       end
#     end
  end
end
