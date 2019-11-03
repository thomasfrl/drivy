# option model
class Option < Model
  @all = []
  attr_accessor :id, :rental_id, :type
  belongs_to 'rental'
  belongs_to 'equipement', foreign_key: 'type', key: 'type'

  def to_json(*)
    type.to_json
  end
end
