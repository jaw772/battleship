class Computer
  attr_accessor :npc_board, :player_board

  def initialize(npc_board, player_board)
    @npc_board = npc_board
    @player_board = player_board
    @placed_ships = [] # might need a way to access where the computer has placed ships?
  end

  # computer places ships in random and VALID locations (exists and not occupied)
  def place_ship
    sub_cells = []
    cruiser_cells = []
    # cruiser_cells = []
    # while sub_cells.length < 2
    #   # make sure the location is valid
    #   # After selecting the first key, the next cells should either go down or across.
    #   sub_cells << @board.keys.sample # saves one random key to the array
    #   un
    #   # @board[key].next
    #
    # end

    sub_cells << @npc_board.cells.keys.sample
    sub_cells << @npc_board.cells.keys.sample
    npc_sub = Ship.new("Submarine", 2)

    until @npc_board.valid_placement?(npc_sub, sub_cells)
      sub_cells[1] = @npc_board.cells.keys.sample
    end

    @npc_board.place(npc_sub, sub_cells)

    cruiser_cells << @npc_board.cells.keys.sample
    cruiser_cells << @npc_board.cells.keys.sample
    cruiser_cells << @npc_board.cells.keys.sample
    npc_cruiser = Ship.new("Cruiser", 3)

    until @npc_board.valid_placement?(npc_cruiser, cruiser_cells)
      cruiser_cells[1] = @npc_board.cells.keys.sample
      
    end

    @npc_board.place(npc_cruiser, cruiser_cells)




    # @board.place("Cruiser", cruiser_cells)
  end

  def fire
    fired_cells = []
    # need to access
    fired_cells << @board.rand_key

  end

  def already_fired?

  end

end  # => :Computer
