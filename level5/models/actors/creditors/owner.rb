# owner class
class Owner
  extend HasMoneyTransfer::Creditor

  def self.car_part(rental)
    (rental.price - rental.commission)
  end
end
