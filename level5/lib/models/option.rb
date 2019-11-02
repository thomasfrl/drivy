# option model
class Option < Model
  attr_accessor :id, :rental_id, :type
  belongs_to 'rental'
  belongs_to 'equipement', foreign_key: 'type', key: 'type'
end
