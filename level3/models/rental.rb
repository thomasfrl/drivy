# rental model
class Rental < Model
  attr_accessor :car_id, :start_date, :end_date, :distance

  def initialize(options)
    super(options)

    @start_date = Date.parse @start_date
    @end_date   = Date.parse @end_date
  end

  def duration
    (end_date - start_date).to_i + 1
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
    end
  end

  def car
    @car ||= Car.find(car_id)
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
end
