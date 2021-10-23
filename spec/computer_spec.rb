require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/cell_generator'
require './lib/computer'

describe Computer do

  before(:each) do
    @npc_cells = CellGenerator.new.cells
    @npc_board = Board.new(@cells)
    @npc = Computer.new
  end

  describe '#initialize' do
    it 'is a computer' do
      expect(@npc).to be_a(Computer)
    end
  end

  describe '#place_ship' do
    it 'places a ship in three consecutive locations' do
      @npc.place_ship
      # continue here
    end
  end



end
