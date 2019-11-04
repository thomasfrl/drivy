def process
  FileCreator.new(Rental, 'id', 'price', 'commissions').process
end
