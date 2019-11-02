# owner class
class Owner
  def self.amount(rental)
    rental.price - rental.commision
  end
end
