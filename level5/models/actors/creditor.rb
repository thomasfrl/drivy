# creditor module
module HasMoneyTransfer
  module Creditor
    def type
      'credit'
    end

    def amount(rental)
      car_part(rental) + equipement_part(rental)
    end

    def car_part(rental)
      rental.commissions["#{name.downcase}_fee".to_sym].to_i
    end

    def equipement_part(rental)
      rental.equipement_prices[name.downcase].to_i
    end
  end
end
