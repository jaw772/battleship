require './lib/ship'
require './lib/cell'
require './lib/cell_generator'
require './lib/board'
require './lib/computer'

class Interface

  def start_game?
    puts "Welcome to BATTLESHIP \nEnter p to play. Enter q to quit."
    response = (gets.chomp).upcase
    until response.eql?('P') || response.eql?('Q')
      puts "Please enter valid option."
      response = (gets.chomp).upcase
    end
    if response.eql?('P')
      puts ''
      puts "Yes! The game is afoot, or aboat, ah you get it."
      setup_game
    elsif response.eql?('Q')
      puts ''
      puts "Fine we didn't want to play with you anyways..."
    end
  end 

  def setup_game
    @player_cells = CellGenerator.new.cells
    @npc_cells = CellGenerator.new.cells
    @player_board = Board.new(@player_cells)
    @npc_board = Board.new(@npc_cells)
    @npc_sub = Ship.new("Submarine", 2)
    @npc_cruiser = Ship.new("Cruiser", 3)
    @npc = Computer.new(@npc_board, @player_board, @npc_sub, @npc_cruiser)
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
    setup_ships
  end

  def setup_ships
    @npc.place_ships(@npc_cruiser)
    @npc.place_ships(@npc_sub)
    puts "My ships are already ready."
    puts "Just waiting on you to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts ''

    puts @player_board.render

    puts "Enter the squares for the Cruiser (3 squares), separated by spaces:"
    place_in_cells = gets.chomp.upcase.split(' ')

    until @player_board.place(@cruiser, place_in_cells) == true do
      puts "Either you're trying to cheat or you've never played BATTLESHIP before, because that's not a valid spot for the ship."
      puts "The boards only so big, let's use valid squares for the Cruiser this time:"
      place_in_cells = gets.chomp.upcase.split(' ')
    end

    puts "Enter the squares for the Submarine (2 squares), separated by spaces:"
    place_in_cells = gets.chomp.upcase.split(' ')

    until @player_board.place(@submarine, place_in_cells) == true do
      puts "The submarine is the small one... it only takes up two spaces."
      puts "Eh, I'll wait, once you figure it out you can use some new squares.:"
      place_in_cells = gets.chomp.upcase.split(' ')
    end

    take_turn
  end

  def take_turn
    puts ''
    puts "The battle has begun!"

    until (@npc_cruiser.sunk? == true && @npc_sub.sunk? == true) || (@cruiser.sunk? == true && @submarine.sunk? == true) do
      puts "=============COMPUTER BOARD============="
      puts @npc_board.render
      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)

      @completed_shot = false
      until @completed_shot == true
        puts "Enter the coordinate you would like to fire upon!"
        @player_choice = (gets.chomp).upcase
        puts ''
        if @npc_board.valid_coordinate?([@player_choice]) == true
          @fired_cell = @npc_board.cells[@player_choice]
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
            puts ''
          else
            puts "Your chosen coordinate has already been attacked. Please enter another coordinate."
            puts ''
          end
        else
          puts "Please pick a valid coordinate."
        end
      end
      puts "======================================="
      puts ''
      if @npc_cruiser.sunk? == false && @npc_sub.sunk? == false
        puts "Computer player fires!"
        @npc.fire
      end
    end

    puts "************** GAME OVER ***************"
    puts ''
    puts "=============COMPUTER BOARD============="
    puts @npc_board.render(true)
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)

    if @npc_cruiser.sunk? == true && @npc_sub.sunk? == true
      puts "Congratulations! The computer has been defeated and you have won the game!!!"
      puts ''
    else
      puts "Fortunately for the computer and unfortunately for you, the computer was won this battle!"
      puts " "
      puts "                           Better luck next time!"
    end
    start_game?
  end
end
