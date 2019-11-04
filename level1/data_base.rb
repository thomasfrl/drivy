# data base
class DataBase
  def self.path
    File.expand_path('data/input.json', __dir__)
  end

  def self.load(model)
    JSON.parse(File.read(path))[model.name.downcase.pluralize].map do |data|
      model.new(data)
    end
  end
end
