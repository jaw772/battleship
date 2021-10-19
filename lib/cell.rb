require './lib/ship'

class Cell

  attr_accessor :coords, :ship_position, :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end

end 
