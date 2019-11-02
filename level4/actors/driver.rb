# driver class
class Driver
  def self.type
    'debit'
  end

  def self.amount(rental)
    rental.price
  end
end
