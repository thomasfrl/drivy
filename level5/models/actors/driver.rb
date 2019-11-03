# driver class
class Driver < Model
  def self.type
    'debit'
  end

  def self.amount(rental)
    rental.price + rental.equipement_prices.values.sum
  end
end
