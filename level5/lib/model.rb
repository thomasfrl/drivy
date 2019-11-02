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
    all.find { |instance| instance.id == id }
  end

  def self.where(options)
    all.select do |instance|
      options.all? do |attr_name, attr_value|
        instance.instance_variable_get("@#{attr_name}") == attr_value
      end
    end
  end

  def self.find_by(options)
    where(options).first
  end

  def self.belongs_to(model_name, **options)
    define_method model_name do
      foreign_key = options[:foreign_key] || 'id'
      key         = send(options[:key] || "#{model_name}_id")

      Object.const_get(model_name.capitalize)
            .find_by(foreign_key.to_sym => key)
    end
  end

  def self.has_many(model_name, **options)
    define_method model_name do
      foreign_key = options[:foreign_key] || "#{self.class.name.downcase}_id"
      key         = send(options[:key] || :id)

      Object.const_get(model_name.singularize.capitalize)
            .where(foreign_key.to_sym => key)
    end
  end
end
