class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Player < Person
  attr_accessor :sign

  def initialize(name, sign)
    super(name)
    @sign = sign
  end
end
