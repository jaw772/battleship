class Turn
  def initialize(npc_board, player_board)
    @npc_board = npc_board
    @player_board = player_board
  end
  def start_round
    puts "The battle has begun!"
    until (@npc_board.@cruiser.sunk? == true && @npc_board.@submarine.sunk? == true) || (player.@cruiser.sunk? == true && player.@submarine.sunk == true) do
      @completed_shot = false
      puts "=============COMPUTER BOARD============="
      @pc_board.render
      puts "==============PLAYER BOARD=============="
      @player_board.render(true)

      puts "Computer player fires!"
      computer.fire
      #@random_cell is the variable or method used to determine the random cell that is fired upon
      if computer.@random_cell.render == "M"
        puts "Your shot on #{@random_cell} is a miss!"
      elsif computer.@random_cell.render == "H"
        puts "Your shot on #{@random_cell} is a hit!"
      else
        puts "Your shot on #{@random_cell} sunk the ship!"
      end
      puts "================================================================"
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
      end
    end
    puts "********** GAME OVER **********"
    if @npc_board.@cruiser.sunk? == true && @npc_board.@submarine.sunk? == true
      puts "Congratulations! The computer has been defeated and you have won the game!!!"
    else
      puts "Fortunately for the computer and unfortunately for you, the computer was won this battle!"
      puts " "
      puts "                           Better luck next time!"
  end
end
