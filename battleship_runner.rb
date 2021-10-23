require './lib/ship'
require './lib/cell'
require './lib/cell_generator'
require './lib/board'
require './lib/interface'
require './lib/computer'


player_cells = CellGenerator.new.cells
player_board = Board.new(player_cells)
npc_cells = CellGenerator.new.cells
npc_board = Board.new(npc_cells)

interface = Interface.new(npc_board, player_board)


interface.start_game?
