class Cell

  attr_accessor :coords, :ship_position, :coordinate
  attr_accessor :ship, :miss
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @ship_position = nil
    @shot_at = false
    @empty = true
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
    @ship_position = @coordinate
    puts
  end

  def empty?
    @empty
    #@ship_position == ""
  end

  def fired_upon?
    if @shot_at == true #&& @coordinate == @ship_position
      true
    else
      false
    end
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
    if reveal == true
      "S"
    elsif @shot_at == false
      '.'
    elsif @miss == true
      'M'
    elsif @miss == false && @ship.sunk? == false
      "H"
    else @ship.sunk? == true
      "X"
    end
  end
end
