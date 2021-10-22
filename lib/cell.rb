class Cell

  attr_accessor :coordinate, :ship, :miss, :empty, :shot_at

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @shot_at = false
    @empty = true
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def empty?
    @empty
  end

  def fired_upon?
    @shot_at
  end

  def fire_upon
    @shot_at = true
    if @empty == false
      @ship.hit
      @miss = false
    else
      @miss = true
    end
  end

  def render(reveal = false)
    if reveal == true && @empty == false && fired_upon? == false
      "S"
    elsif @shot_at == false
      '.'
    elsif @miss == true
      'M'
    elsif @miss == false && @ship.sunk? == false
      "H"
    elsif @ship.sunk? == true
      "X"
    else
      ""
    end
  end
end
