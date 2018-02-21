class GameSerializer < ActiveModel::Serializer
  attributes :id, :scores

  def scores
  end

end
