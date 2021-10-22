class Interface
  attr_reader

  #the board may interact with player_turn and computer class
  def initialize(player_board, npc_board)
    @player_board = player_board
    @npc_board = npc_board
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def start_game?
    puts "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
    response = (gets.chomp).upcase
    case response
      when 'P'
        "Yes! The game is afoot, or aboat, ah you get it."
        setup_ships
      when 'Q'
        "Fine we didn't want to play with you anyways..."
      else
        "Please enter valid option."
    end
  end

  def setup_ships
    #@npc_board.place
    puts "My ships are already ready."
    puts "Just waiting on you to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    @player_board.render

    puts "Enter the squares for the Cruiser (3 spaces):"
    place_in_cells = gets.chomp.upcase.split(' ')

    place_in_cells.each {|cell| @player_board.valid_coordinate?(cell)}

    if place_in_cells == @player_board.valid_coordinate? && place_in_cells == @player_board.valid_placement?
      @player_board.place(@cruiser, place_in_cells)

      puts "Enter valid squares for the Cruiser (3 space):"
      place_in_cells = gets.chomp.upcase.split(' ')
    else
      "Either you're trying to cheat or you've never played BATTLESHIP before, because that's not a valid spot for the ship."
    end
  end
end

# if @fired_cell.render == "M"
#     puts "Your shot on #{@player_choice} is a miss!"
#   elsif @fired_cell.render == "H"
#     puts "Your shot on #{@player_choice} is a hit!"
#   else
#     puts "Your shot on #{@player_choice} sunk the ship!"
#   end
