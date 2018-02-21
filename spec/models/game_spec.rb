require 'rails_helper'

describe Play do
  context "Instance methods" do
    context "#score_player_1" do
      it "totals player 1s scores for the game" do
        tyler = User.create(id: 1, name: "Tyler")
        chewbacca = User.create(id: 2, name: "Chewbacca")

        game = Game.create(player_1: tyler, player_2: chewbacca)

        tyler.plays.create(game: game, word: "light", score: 9)
        tyler.plays.create(game: game, word: "yes", score: 6)
        chewbacca.plays.create(game: game, word: "dark", score: 9)
        chewbacca.plays.create(game: game, word: "no", score: 2)

        expect(game.score_player_1).to eq({"user_id"=> tyler.id, "score"=>15})
      end
    end
    context "#score_player_2" do
      it "totals player 2s scores for the game" do
        tyler = User.create(id: 1, name: "Tyler")
        chewbacca = User.create(id: 2, name: "Chewbacca")

        game = Game.create(player_1: tyler, player_2: chewbacca)

        tyler.plays.create(game: game, word: "light", score: 9)
        tyler.plays.create(game: game, word: "yes", score: 6)
        chewbacca.plays.create(game: game, word: "dark", score: 9)
        chewbacca.plays.create(game: game, word: "no", score: 2)

        expect(game.score_player_2).to eq({"user_id"=> chewbacca.id, "score"=>11})
      end
    end
  end
end
