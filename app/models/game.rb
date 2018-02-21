class Game < ApplicationRecord
  include ActiveModel::Serialization

  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def score_player_1
    player_1.plays.reduce(Hash.new(0)) do |result, play|
      unless result.has_key?(result["user_id"])
        result["user_id"] = play.user_id
      end
      result["score"] += play.score
      result
    end
  end

  def score_player_2
    player_2.plays.reduce(Hash.new(0)) do |result, play|
      unless result.has_key?(result["user_id"])
        result["user_id"] = play.user_id
      end
      result["score"] += play.score
      result
    end
  end
end
