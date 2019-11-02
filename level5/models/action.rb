# action model
class Action < Model
  attr_accessor :who, :rental_id
  @@all = []

  def initialize(options)
    super options

    @@all << self
  end

  def rental
    @rental ||= Rental.find(rental_id)
  end

  def amount
    actor_class.amount(rental)
  end

  def type
    actor_class.type
  end

  def actor_class
    Object.const_get(who.capitalize)
  end

  def self.all
    @@all
  end

  def to_json(*)
    %i[who type amount].map do |attr|
      [attr, send(attr)]
    end.to_h.to_json
  end
end
