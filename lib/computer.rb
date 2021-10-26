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

    # require 'pry'; binding.pry

    # # while !valid_placement? [do]
    # #   if @npc_board.cells.
    # # end
    # require 'pry'; binding.pry
    submarine_length = 2
    board_length = Math.sqrt(@npc_board.cells.size).to_i
    board_array = @npc_board.cells.keys.each_slice(board_length).entries
    # column_array = [][]
    # require 'pry'; binding.pry
    # 1 = horizontal, 2 = vertical
    npc_decision = [1,2].sample
    p "DEBUG: npc_decision: #{npc_decision}"
    if npc_decision == 1
      # find a sample row in the nested arrays
      sample_row = board_array.sample
      # find a random starting point within the random row.
      start_cell = sample_row.sample

      sub_cells << start_cell
      start_index = sample_row.rindex(start_cell)

      #if there is room to the right of the starting cell...
      if start_index + (submarine_length - 1) < board_length
        # iterate for the amount of cells needed to place the rest of a ship
        (submarine_length-1).times do |num|
          next_cell = sample_row[start_index + (num+1)]
          # add the next cell to the list of spaces
          sub_cells.push(next_cell)
        end
      # if there is room to the left of the starting cell...
      elsif start_index - (submarine_length - 1) > 0
        # iterate for the amount of cells needed to place the rest of a ship
        (submarine_length-1).times do |num|
          prev_cell = sample_row[start_index - (num+1)]
          # add the previous cell to the list of spaces
          sub_cells.push(prev_cell)
        end
      end
    else
      # Computer decided to place a ship vertically.
      # First sort by column in the nested arrays by column
      require 'pry'; binding.pry
      vertical_array = board_array.transpose
      # Start sample row in the nested arrays
      sample_column = vertical_array.sample
      # find a random starting point within the random row.
      start_cell = sample_column.sample

      sub_cells << start_cell
      start_index = sample_column.rindex(start_cell)

      #if there is room above the starting cell...
      if start_index + (submarine_length - 1) < board_length
        # iterate for the amount of cells needed to place the rest of a ship
        (submarine_length-1).times do |num|
          next_cell = sample_column[start_index + (num+1)]
          # add the next cell to the list of spaces
          sub_cells.push(next_cell)
        end
      # if there is room to the left of the starting cell...
      elsif start_index - (submarine_length - 1) > 0
        # iterate for the amount of cells needed to place the rest of a ship
        (submarine_length-1).times do |num|
          prev_cell = sample_column[start_index - (num+1)]
          # add the previous cell to the list of spaces
          sub_cells.push(prev_cell)
        end
      end
    end
    p sub_cells
    require 'pry'; binding.pry

  # WORKING CODE
  #   sub_cells << @npc_board.cells.keys.sample
  #   sub_cells << @npc_board.cells.keys.sample
  #
  #   until @npc_board.valid_placement?(@npc_sub, sub_cells)
  #     sub_cells[1] = @npc_board.cells.keys.sample
  #   end
  #
  #   @npc_board.place(@npc_sub, sub_cells)
  #
  #   cruiser_cells << @npc_board.cells.keys.sample
  #   cruiser_cells << @npc_board.cells.keys.sample
  #   cruiser_cells << @npc_board.cells.keys.sample
  #
  #   until @npc_board.valid_placement?(@npc_cruiser, cruiser_cells)
  #     cruiser_cells[1] = @npc_board.cells.keys.sample
  #     cruiser_cells[2] = @npc_board.cells.keys.sample
  #   end
  #
  #   @npc_board.place(@npc_cruiser, cruiser_cells)
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
