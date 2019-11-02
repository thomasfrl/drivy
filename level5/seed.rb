def seed
  Equipement.new(type: 'gps', creditor: 'owner', price_per_day: 500)
  Equipement.new(type: 'baby_seat', creditor: 'owner', price_per_day: 200)
  Equipement.new(type: 'additional_insurance',
                 creditor: 'drivy',
                 price_per_day: 1000)
end
