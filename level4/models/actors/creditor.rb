# creditor class
class Creditor
  def self.type
    'credit'
  end

  def self.amount(rental)
    rental.commisions["#{name.downcase}_fee"]
  end
end
