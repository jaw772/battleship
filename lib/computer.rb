class Computer
  attr_accessor :board, :cells

  def initialize
    @cells
    @board
    @placed_ships = [] # might need a way to access where the computer has placed ships?
  end

  # User hitting P can possibly trigger the computer_play method to create the cells and board.
  def computer_play
    @cells = CellGenerator.new
    @board = Board.new(@cells)
  end

  # computer places ships in random and VALID locations (exists and not occupied)
  def place_ship
    sub_cells = []
    cruiser_cells = []
    while sub_cells.length < 2
      # make sure the location is valid
      # After selecting the first key, the next cells should either go down or across.
      sub_cells << @board.rand_key
    end

    while cruiser_cells.length < 3
      # make sure the location is valid
      # make sure these aren't the same keys
      # After selecting the first key, the next cells shoule either go down or across
      cruiser_cells << @board.rand_key
    end

    @board.place("Submarine", sub_cells)


  end

  def fire
    fired_cells = []
    # need to access
    fired_cells << @board.rand_key

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
