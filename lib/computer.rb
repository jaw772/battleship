class Computer
  attr_accessor :npc_board, :player_board

  def initialize(npc_board, player_board)
    @npc_board = npc_board
    @player_board = player_board
    @placed_ships = [] # might need a way to access where the computer has placed ships?
  end

  # computer places ships in random and VALID locations (exists and not occupied)
  def place_ships
    sub_cells = []
    cruiser_cells = []

    npc_sub = Ship.new("Submarine", 2)

    sub_cells << @npc_board.cells.keys.sample
    sub_cells << @npc_board.cells.keys.sample


    until @npc_board.valid_placement?(npc_sub, sub_cells)
      sub_cells[1] = @npc_board.cells.keys.sample
    end

    @npc_board.place(npc_sub, sub_cells)

    npc_cruiser = Ship.new("Cruiser", 3)

    cruiser_cells << @npc_board.cells.keys.sample
    cruiser_cells << @npc_board.cells.keys.sample
    cruiser_cells << @npc_board.cells.keys.sample


    until @npc_board.valid_placement?(npc_cruiser, cruiser_cells)
      cruiser_cells[1] = @npc_board.cells.keys.sample
      cruiser_cells[2] = @npc_board.cells.keys.sample
    end

    @npc_board.place(npc_cruiser, cruiser_cells)
  end

  def fire(@player_board)
    @completed_shot = false
    until @completed_shot == true
      @computer_choice = @player_board.cells.keys.sample
      if @player_board.valid_coordinate?(@computer_choice) == true
        @fired_cell == @player_board.cells[@computer_choice]
        if @fired_cell.fired_upon? == false
          @fired_cell.fire_upon
          if @fired_cell.render == "M"
            puts "Computer's shot on #{@computer_choice} is a miss!"
          elsif @fired_cell.render == "H"
            puts "Computer's shot on #{@computer_choice} is a hit!"
          else
            puts "Computer's shot on #{@computer_choice} sunk the ship!"
          end
          @completed_shot = true
        end
      end
    end
  end

  def already_fired?

  end

end  # => :Computer
