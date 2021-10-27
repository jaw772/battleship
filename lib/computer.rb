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
    # ship_cells = []
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

      # 1 = horizontal, 2 = vertical
      npc_decision = [1,2].sample
      if npc_decision == 2
        board_array = board_array.transpose
      else
        board_array
      end

      # find a sample row in the nested arrays
      sample_cells = board_array.sample

      # find a random starting point within the random row.
      start_cell = sample_cells.sample

      ship_cells << start_cell
      start_index = sample_cells.rindex(start_cell)

      #if there is room to the right of the starting cell...
      if (start_index + (ship_length - 1) < sample_cells.length)
        if sample_cells[start_index..start_index + (ship_length - 1)] != "OCCUPIED"
          # iterate for the amount of cells needed to place the rest of a ship
          (ship_length - 1).times do |num|
            next_cell = sample_cells[start_index + (num + 1)]
            # add the next cell to the list of spaces
            ship_cells.push(next_cell)
          end
        elsif start_index-1 != 0
          start_index.next
          (ship_length - 1).times do |num|
            next_cell = sample_cells[start_index + (num + 1)]
            # add the next cell to the list of spaces
            ship_cells.push(next_cell)
          end
        end
      # if there is room to the left of the starting cell...
      elsif start_index - (ship_length - 1) > 0
        if sample_cells[start_index..start_index - (ship_length - 1)] != "OCCUPIED"
          # iterate for the amount of cells needed to place the rest of a ship
          (ship_length - 1).times do |num|
            prev_cell = sample_cells[start_index - (num + 1)]
            # add the previous cell to the list of spaces
            ship_cells.push(prev_cell)
          end
        elsif start_index+1 != board_length-1
          start_index.next
          (ship_length - 1).times do |num|
            next_cell = sample_cells[start_index + (num + 1)]
            # add the next cell to the list of spaces
            ship_cells.push(next_cell)
          end
        end
      end
      if !ship_cells.include?("OCCUPIED")

        if @npc_board.valid_placement?(ship, ship_cells)
          it_works = true
        end
      end
    end
    @npc_board.place(ship, ship_cells)
  end

  def fire
    completed_shot = false
    until completed_shot == true
      @computer_choice = @player_board.cells.keys.sample
      if @player_board.valid_coordinate?([@computer_choice]) == true
        @fired_cell = @player_board.cells[@computer_choice]
        if @fired_cell.fired_upon? == false
          @fired_cell.fire_upon
          completed_shot = true
        end
      end
    end
  end

  def fire_results
    if @fired_cell.render == "M"
      puts "Computer's shot on #{@computer_choice} is a miss!"
      puts ''
    elsif @fired_cell.render == "H"
      puts "Computer's shot on #{@computer_choice} is a hit!"
      puts ''
    else
      puts "Computer's shot on #{@computer_choice} sunk the ship!"
      puts ''
    end
  end
end
