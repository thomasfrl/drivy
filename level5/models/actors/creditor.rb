# creditor class
class Creditor < Model
  def self.type
    'credit'
  end

  def self.amount(rental)
    car_part(rental) + equipement_part(rental)
  end

  def self.car_part(rental)
    rental.commissions["#{name.downcase}_fee".to_sym].to_i
  end

  def self.equipement_part(rental)
    rental.equipement_prices[name.downcase].to_i
  end
end
