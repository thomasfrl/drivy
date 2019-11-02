# owner class
class Owner < Creditor
  def self.amount(rental)
    rental.price - rental.commission
  end
end
