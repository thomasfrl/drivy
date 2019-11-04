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
    car.price_per_day * duration + car.price_per_km * distance
  end

  def car
    @car ||= Car.find(car_id)
  end
end
