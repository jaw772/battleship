require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/cell_generator'
require './lib/computer'

describe Computer do

  before(:each) do
    @npc_cells = CellGenerator.new.cells
    @npc_board = Board.new(@npc_cells)
    @player_cells = CellGenerator.new.cells
    @player_board = Board.new(@player_cells)
    @npc = Computer.new(@npc_board, @player_board)
  end

  describe '#initialize' do
    xit 'is a computer' do
      expect(@npc).to be_a(Computer)
    end
  end

  describe '#place_ships' do
    it 'places a ship in three consecutive locations' do
require 'pry'; binding.pry
      # @npc.place_ships
      # continue here
    end
  end



end
