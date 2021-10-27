class Computer
  attr_accessor :npc_board, :player_board

  def initialize(npc_board, player_board, npc_sub, npc_cruiser)
    @npc_board = npc_board
    @player_board = player_board
    @npc_sub = npc_sub
    @npc_cruiser = npc_cruiser
    @placed_ships = []
  end

  def place_ships(ship)
    ship_length = ship.length
    board_length = Math.sqrt(@npc_board.cells.size).to_i
    it_works = false

    until it_works do
      ship_cells = []
      board_array = []

      @npc_board.cells.each do |cell|
        if @npc_board.cells[cell[0]].empty == false
          board_array << "OCCUPIED"
        else
          board_array << cell[0]
        end
      end

      board_array = board_array.each_slice(board_length).entries

      # 1 = place horizontally, 2 = place vertically
      npc_decision = [1,2].sample
      if npc_decision == 2
        board_array = board_array.transpose
      else
        board_array
      end

      # find a sample row in the nested arrays
      ship_row = board_array.sample

      # find a random starting point within the random row.
      start_cell = ship_row.sample

      ship_cells << start_cell
      first_cell = ship_row.rindex(start_cell)
      rest_of_needed_spaces = ship_length - 1

      #if there are available cells for the rest of the ship to the right/bottom
      if (first_cell + rest_of_needed_spaces < board_length)
        # if any of the potential cells are not occupied, then place ships as normal
        if ship_row[first_cell..rest_of_needed_spaces] != "OCCUPIED"
          # iterate for the amount of cells needed to place the rest of a ship
          rest_of_needed_spaces.times do |num|
            next_cell = ship_row[first_cell + (num + 1)]
            # add the next cell to the list of spaces
            ship_cells.push(next_cell)
          end
        elsif first_cell-1 != 0
          rest_of_needed_spaces.times do |num|
            prev_cell = ship_row[first_cell - 1 + (num + 1)]
            # add the next cell to the list of spaces
            ship_cells.push(prev_cell)
          end
        end

      # if there are available cells for the rest of the ship to the left/top
      elsif first_cell - (rest_of_needed_spaces) > 0
        # if any of the potential cells are not occupied, then place ships as normal
        if ship_row[first_cell..first_cell - rest_of_needed_spaces] != "OCCUPIED"
          # iterate for the amount of cells needed to place the rest of a ship
          rest_of_needed_spaces.times do |num|
            prev_cell = ship_row[first_cell - (num + 1)]
            # add the previous cells to the list of ship spaces
            ship_cells.push(prev_cell)
          end
        # otherwise, if there is room for the starting space to move over to make room...
        elsif first_cell+1 != board_length-1
          rest_of_needed_spaces.times do |num|
            next_cell = ship_row[(first_cell + 1) + (num + 1)]
            # add the next cell to the list of spaces
            ship_cells.push(next_cell)
          end
        end
      end

      # if no "OCCUPIED" cells exist in the final ship placements,
      if !ship_cells.include?("OCCUPIED")
        # if the ship placements are valid, then it_works and exits loop
        it_works = @npc_board.valid_placement?(ship, ship_cells)
      end
    end

    @npc_board.place(ship, ship_cells)
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
