class Computer
  attr_accessor :npc_board, :player_board

  def initialize(npc_board, player_board, npc_sub, npc_cruiser)
    @npc_board = npc_board
    @player_board = player_board
    @npc_sub = npc_sub
    @npc_cruiser = npc_cruiser
    @placed_ships = []
  end

  def place_ships
    sub_cells = []
    cruiser_cells = []

    sub_cells << @npc_board.cells.keys.sample
    sub_cells << @npc_board.cells.keys.sample


    until @npc_board.valid_placement?(@npc_sub, sub_cells)
      sub_cells[1] = @npc_board.cells.keys.sample
    end

    @npc_board.place(@npc_sub, sub_cells)

    cruiser_cells << @npc_board.cells.keys.sample
    cruiser_cells << @npc_board.cells.keys.sample
    cruiser_cells << @npc_board.cells.keys.sample


    until @npc_board.valid_placement?(@npc_cruiser, cruiser_cells)
      cruiser_cells[1] = @npc_board.cells.keys.sample
      cruiser_cells[2] = @npc_board.cells.keys.sample
    end

    @npc_board.place(@npc_cruiser, cruiser_cells)
  end


  def fire
    completed_shot = false
    until completed_shot == true
      computer_choice = @player_board.cells.keys.sample
      if @player_board.valid_coordinate?([computer_choice]) == true
        fired_cell = @player_board.cells[computer_choice]
        if fired_cell.fired_upon? == false
          fired_cell.fire_upon
          fire_results(fired_cell, computer_choice)
          completed_shot = true
        end
      end
    end
  end

  def fire_results(fired_cell, computer_choice)
    if fired_cell.render == "M"
      puts "Computer's shot on #{computer_choice} is a miss!"
      puts ''
    elsif fired_cell.render == "H"
      puts "Computer's shot on #{computer_choice} is a hit!"
      puts ''
    else
      puts "Computer's shot on #{computer_choice} sunk the ship!"
      puts ''
    end
  end
end
