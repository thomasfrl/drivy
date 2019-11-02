# owner class
class Owner < Creditor
  def self.car_part(rental)
    (rental.price - rental.commission)
  end
end
