class Interface
  attr_reader

  #I think interface will only interact with player_turn and computer class
  def initialize(player_board, npc_board)
    @player_board = player_board
    @npc_board = npc_board
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def start_game?
    puts "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
    response = (gets.chomp).upcase
    until response == 'P' || 'Q'
        "Please enter valid option."
    end
    if response == 'P'
      "Yes! The game is afoot, or aboat, ah you get it."
      setup_ships
    elsif'Q'
      "Fine we didn't want to play with you anyways..."
    end
  end

  def setup_ships
    #@npc_board.place the npc will generate cells and put those into a board then place it's ships randomly
    puts "My ships are already ready."
    puts "Just waiting on you to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    @player_board.render

    #the player will enter the coordinates they want for both ships below and they will be added to a pre-generated player board
    puts "Enter the squares for the Cruiser (3 spaces):"
    place_in_cells = gets.chomp.upcase.split(' ')

    until @player_board.place(@cruiser, place_in_cells) == true do
      puts "Either you're trying to cheat or you've never played BATTLESHIP before, because that's not a valid spot for the ship."
      puts "The boards only so big, let's use valid squares for the Cruiser this time:"
      place_in_cells = gets.chomp.upcase.split(' ')
    end

    puts "Enter the squares for the Submarine (2 spaces):"
    place_in_cells = gets.chomp.upcase.split(' ')

    until @player_board.place(@submarine, place_in_cells) == true do
      puts "The submarine is the small one... it only takes up two spaces."
      puts "Eh, I'll wait, once you figure it out you can use some new squares.:"
      place_in_cells = gets.chomp.upcase.split(' ')
    end

    take_turn
  end

  def take_turn
    puts "The battle has begun!"
    until (@npc_board.@cruiser.sunk? == true && @npc_board.@submarine.sunk? == true) || (@player_board.@cruiser.sunk? == true && @player_board.@submarine.sunk? == true) do
      puts "=============COMPUTER BOARD============="
      @npc_board.render
      puts "==============PLAYER BOARD=============="
      @player_board.render(true)

      @completed_shot = false
      until @completed_shot == true
        puts "Enter the coordinate you would like to fire upon!"
        @player_choice == (gets.chomp).upcase
        if @npc_board.valid_coordinate?(@player_choice) == true
          @fired_cell == @npc_board.cells[@player_choice]
          if @fired_cell.fired_upon? == false
            @fired_cell.fire_upon
            if @fired_cell.render == "M"
              puts "Your shot on #{@player_choice} is a miss!"
            elsif @fired_cell.render == "H"
              puts "Your shot on #{@player_choice} is a hit!"
            else
              puts "Your shot on #{@player_choice} sunk the ship!"
            end
            @completed_shot = true
          else
            puts "Your chosen coordinate has already been attacked. Please enter another coordinate."
          end
        else
          puts "Please pick a valid coordinate."
        end
        puts "================================================================"
        puts "Computer player fires!"
        computer.fire(@player_board)
      end
    end

    puts "********** GAME OVER **********"

    puts "=============COMPUTER BOARD============="
    @npc_board.render(true)
    puts "==============PLAYER BOARD=============="
    @player_board.render(true)

    if @npc_board.@cruiser.sunk? == true && @npc_board.@submarine.sunk? == true
      puts "Congratulations! The computer has been defeated and you have won the game!!!"
      start_game?
    else
      puts "Fortunately for the computer and unfortunately for you, the computer was won this battle!"
      puts " "
      puts "                           Better luck next time!"
      start_game?
    end
  end
end