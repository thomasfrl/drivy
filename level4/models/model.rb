# model core
class Model
  attr_reader :id

  def initialize(options)
    options.each do |attr_name, attr_value|
      instance_variable_set("@#{attr_name}", attr_value)
    end
  end

  def self.all
    @all ||= DataBase.load(self)
  end

  def self.find(id)
    all.find { |model| model.id == id }
  end

  def self.where(options)
    all.select do |instance|
      options.all? do |attr_name, attr_value|
        instance.instance_variable_get("@#{attr_name}") == attr_value
      end
    end
  end
end
