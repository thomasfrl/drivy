def process
  FileCreator.new(Rental, 'id', 'price', 'commission').process
end
