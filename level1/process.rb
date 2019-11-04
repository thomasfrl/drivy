def process
  FileCreator.new(Rental, 'id', 'price').process
end
