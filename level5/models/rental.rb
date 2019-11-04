# rental model
class Rental < Model
  @all = []
  attr_accessor :car_id, :start_date, :end_date, :distance

  belongs_to 'car'
  has_many 'actions'
  has_many 'options'

  def initialize(options)
    super(options)

    create_actions
  end

  def parsed_start_date
    Date.parse start_date
  end

  def parsed_end_date
    Date.parse end_date
  end

  def duration
    (parsed_end_date - parsed_start_date).to_i + 1
  end

  def price
    duration_price + distance__price
  end

  def distance__price
    car.price_per_km * distance
  end

  def duration_price
    (1..duration).sum do |day_number|
      self.class.price_coefficient(day_number) * car.price_per_day
    end.to_i
  end

  def commissions
    insurance_fee  = (0.5 * commission).to_i
    assistance_fee = 100 * duration
    drivy_fee      = commission - insurance_fee - assistance_fee

    { insurance_fee: insurance_fee,
      assistance_fee: assistance_fee,
      drivy_fee: drivy_fee }
  end

  def commission
    (0.3 * price).to_i
  end

  def equipements
    options.map(&:equipement)
  end

  def equipement_prices
    {}.tap do |equipement_prices|
      equipements.each do |equipement|
        equipement_prices[equipement.creditor] ||= 0
        equipement_prices[equipement.creditor] +=
          equipement.price_per_day * duration
      end
    end
  end

  def self.price_coefficient(day_number)
    price_coefficients.find do |limit_day, _|
      day_number >= limit_day.to_s.to_i
    end.last
  end

  def self.price_coefficients
    {
      '11': 0.5,
      '5': 0.7,
      '2': 0.9,
      '1': 1
    }
  end

  protected

  def create_actions
    %w[driver owner insurance assistance drivy].each do |actor|
      Action.new(who: actor, rental_id: id)
    end
  end
end
