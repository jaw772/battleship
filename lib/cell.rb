class Cell

  attr_accessor :coords, :ship_position, :coordinate
  attr_accessor :ship, :miss
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @ship_position = ""
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
    if @coordinate == @ship_position
      @ship.hit
      @miss = false
    else
      @miss = true
    end
  end

  def render(reveal = false)
    if reveal == true
      "S"
    elsif fired_upon? == true && @miss == false
      @ship_position = "H"
    elsif fired_upon? == true && @ship.sunk? == true
      @ship_position = "X"
    elsif @miss == true && @empty == true
      @coordinate = "M"
    else
      @coordinate = "."
    end
  end
end
