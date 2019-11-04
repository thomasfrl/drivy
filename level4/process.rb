def process
  FileCreator.new(Rental, 'id', 'actions').process
end
