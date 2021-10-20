class Cell

  attr_accessor :coords, :ship_position, :coordinate
  attr_accessor :ship, :miss
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @ship_position = ""
  end

  def place_ship(ship)
    @ship = ship
    @ship_position = @coordinate
    puts
  end

  def empty?
    @ship_position == ""
  end

  def fired_upon?
    @ship.health < @ship.length
  end

  def fire_upon
    if @coordinate = @ship_position
      @ship.hit
    else
      @miss = true
  end

  def render(reveal = false)
    if reveal == true
      puts "S"
    end

    if fired_upon? == true
      @ship_position = "H"
    elsif fired_upon? == true && @ship.health = 0
      @ship_position = "X"
    elsif @miss == true
      @coordinate = "M"
    else
      @coordinate = "."
    end
  end
end
end
