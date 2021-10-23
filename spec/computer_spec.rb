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
    it 'is a computer' do
      expect(@npc).to be_a(Computer)
    end
  end

  describe '#place_ships' do
    it 'places two ships' do
      @npc.npc_board.cells.values.all? {|cell| cell.ship == nil}
      #go through each cell and evaluate the ship
      @npc.place_ships

      expected = @npc.npc_board.cells.values.count {|cell| cell.ship != nil}
      expect(expected).to eq(5)
    end

    it 'has a cruiser and a sub' do
      @npc.place_ships
      expected = @npc.npc_board.cells.values.count do |cell|
        if cell.ship != nil
          cell.ship.name == "Cruiser"
        end
      end

      expect(expected).to eq(3)

      expected = @npc.npc_board.cells.values.count do |cell|
        if cell.ship != nil
          cell.ship.name == "Submarine"
        end
      end

      expect(expected).to eq(2)
    end
  end
end
