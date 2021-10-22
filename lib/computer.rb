class Computer
  attr_accessor :board, :cells,

  def initialize
    @cells
    @board
  end

  # User hitting P can possibly trigger the computer_play method to create the cells and board.
  def computer_play
    p"test"
    #@cells = CellGenerator.new
    @board = Board.new(@cells)
  end
  # computer places ships in random and VALID locations (exists and not occupied)
  def place_ship
    place = @board.rand_value

  end

  def fire

  end

  def already_fired?
  end

end  # => :Computer
