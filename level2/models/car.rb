class Car < Model
  attr_accessor :price_per_day, :price_per_km
  def to_json(*)
    ['ml', 'lmml'].to_json
  end
end