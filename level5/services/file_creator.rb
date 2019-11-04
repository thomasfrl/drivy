# file creator service
class FileCreator
  def initialize(file_name = File.expand_path('../data/output.json', __dir__))
    @file_name = file_name
  end

  def process(**args)
    File.open(@file_name, 'w') do |f|
      f.write(send_parse(self, args).to_json)
    end
  end

  protected

  def parse(model_name, instances, attr_names)
    values = instances.map do |instance|
      attr_names.map do |attr_name|
        next send_parse(instance, attr_name) if attr_name.class == Hash

        { attr_name => instance.send(attr_name) }
      end.reduce(&:merge)
    end

    { model_name => values }
  end

  def send_parse(instance, options)
    options.map do |model_name, attributes|
      instances = get_instances(model_name, instance)

      parse(model_name, instances, attributes)
    end.reduce(&:merge)
  end

  def get_instances(model_name, instance)
    return Array(instance.send(model_name)) unless instance == self

    Object.const_get(model_name.to_s.singularize.capitalize).all
  end
end
