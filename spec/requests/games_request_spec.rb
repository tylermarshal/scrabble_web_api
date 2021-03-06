require 'rails_helper'

describe "games API" do
  context "HTTP GET" do
    it "returns an individual games information" do
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      get "/api/v1/games/#{game.id}"

      expect(response).to be_successful

      get_game = JSON.parse(response.body)

      expect(get_game["game_id"]).to eq(game.id)
      expect(get_game["scores"].class).to eq(Array)
      expect(get_game["scores"].first["user_id"]).to eq(1)
      expect(get_game["scores"].first["score"]).to eq(15)
      expect(get_game["scores"].last["user_id"]).to eq(2)
      expect(get_game["scores"].last["score"]).to eq(16)
    end
  end
end
