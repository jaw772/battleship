require './lib/ship'

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
    ship_position = @coordinate
    puts
  end

  def empty?
    ship_position == ""
  end




end
