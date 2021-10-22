def Computer
  attr_accessor :board

  def initialize
    @coordinates
    @cells = CellGenerator.new
    @board = Board.new(@cells)
  end


  # computer places ships in random and VALID locations (exists and not occupied)
  def place_ship
    
  end

  def fire

  end

  def already_fired?
  end

end
