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
    # if @fired_cell.render == "M"
    #     puts "Your shot on #{@player_choice} is a miss!"
    #   elsif @fired_cell.render == "H"
    #     puts "Your shot on #{@player_choice} is a hit!"
    #   else
    #     puts "Your shot on #{@player_choice} sunk the ship!"
    #   end
  end

  def already_fired?
  end

end  # => :Computer
