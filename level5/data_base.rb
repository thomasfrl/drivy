# data base
class DataBase
  def self.direction
    './data/input.json'
  end

  def self.file
    File.read(direction)
  end

  def self.load(model)
    JSON.parse(file)[model.name.downcase.pluralize].map do |data|
      model.new(data)
    end
  end
end
