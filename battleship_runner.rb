require './lib/ship'
require './lib/cell'
require './lib/cell_generator'
require './lib/board'
require './lib/interface'
require './lib/computer'
require './lib/turn'

cruiser = Ship.new('Cruiser', 3)
submarine = Ship.new('Submarine', 2)
cells = CellGenerator.new.cells
player_board = Board.new(cells)
npc_board = Board.new(cells) #computer placing ships will need to effect this one

computer = Computer.new
turn = Turn.new(npc_board, player_board)
interface = Interface.new(npc_board, player_board)


if interface.start_game? == 'P'
  turn.take_turn


#instead of evaluating the response to start game here, we can do it in turn
#thinking that this is essentially all we may need in our runner file?
