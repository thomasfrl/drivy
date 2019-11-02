# model without input
class NoDB < Model
  @all = []

  def initialize(options)
    super options

    self.class.all += [self]
  end

  def self.all
    @all
  end

  def self.all=(value)
    @all = value
  end
end
