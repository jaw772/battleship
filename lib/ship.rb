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

  def sunk?
    @life == 0
  end

  #may need to update to say that we can't hit the ship once it has no health
  def hit
    if @life > 0
      @life -= 1
    end
  end
end
