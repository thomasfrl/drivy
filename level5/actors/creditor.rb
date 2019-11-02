# creditor class
class Creditor
  def self.type
    'credit'
  end

  def self.amount(rental)
    rental.commissions["#{name.downcase}_fee".to_sym]
  end
end
