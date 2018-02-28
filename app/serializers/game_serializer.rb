class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [{user_id: object.player_1.id,
      score: object.score_player_1},
      {user_id: object.player_2.id,
      score: object.score_player_2}]
  end

end
