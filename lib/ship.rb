class Ship
  attr_reader :name, :ship_size
  attr_accessor :life
  def initialize(name, ship_size)
    @name = name
    @ship_size = ship_size
    @life = ship_size
  end

  def length
    @ship_size
  end

  def health
    @life
  end

  


end
