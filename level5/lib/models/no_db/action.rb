# action model
class Action < NoDB
  @all = []

  attr_accessor :who, :rental_id

  belongs_to 'rental'

  def amount
    actor_class.amount(rental)
  end

  def type
    actor_class.type
  end

  def actor_class
    Object.const_get(who.capitalize)
  end
end
