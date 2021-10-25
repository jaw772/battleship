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
    # Computer con place ships randomly in valid locations
    # need a random starting point
    require 'pry'; binding.pry
    sub_start = @npc_board.cells.keys.sample

    sub_size = 3
    sub = []
    sub.push(sub_start)

    board_options = [][]

    





    # Need to see what the adjacent squares are on the board.
    # =>

    # ship_size = 3
    # array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    # chosen_cells = []
    # random_selection = array.sample
    # chosen_cells.push(random_selection)
    #
    # # if the ship has room to make a random decision...
    # if random_selection + 1 <= array.size && random_selection - 1 >= 0
    #   # computer can choose a random selection of possible directions COME UP WITH A WAY TO SHOW WHICH RANDOM DIRECTIONS ARE AVAILABLE TO BE INCLUDED IN THE SELECTION
    #   random_direction = [1, 2].sample
    #   #
    #   if 1
    #   random_selection.push(random_direction)


    # There will be a max of 4 adjacent possibilities.
    # A new random decision of 1-4 can be made to decide which direction.
    # => AS LONG AS THERE IS ROOM



    # WORKING CODE BELOW:
  #   sub_cells << @npc_board.cells.keys.sample
  #   sub_cells << @npc_board.cells.keys.sample
  #
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
  #
  #   until @npc_board.valid_placement?(@npc_cruiser, cruiser_cells)
  #     cruiser_cells[1] = @npc_board.cells.keys.sample
  #     cruiser_cells[2] = @npc_board.cells.keys.sample
  #   end
  #
  #   @npc_board.place(@npc_cruiser, cruiser_cells)
  # end
  #
  # def fire
  #   completed_shot = false
  #   until completed_shot == true
  #     @computer_choice = @player_board.cells.keys.sample
  #     if @player_board.valid_coordinate?([@computer_choice]) == true
  #       @fired_cell = @player_board.cells[@computer_choice]
  #       if @fired_cell.fired_upon? == false
  #         @fired_cell.fire_upon
  #         # fire_results(fired_cell, computer_choice)
  #         completed_shot = true
  #       end
  #     end
  #   end
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
